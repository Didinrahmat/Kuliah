import cv2
import easyocr
import time

reader = easyocr.Reader(['en'], gpu=True)  # ganti gpu=True jika pakai GPU

cap = cv2.VideoCapture(0)

while True:
    ret, frame = cap.read()
    if not ret:
        break

    start = time.time()
    results = reader.readtext(frame)
    end = time.time()

    # Tampilkan hasil dengan bounding box merah dan font seragam
    for (bbox, text, prob) in results:
        (top_left, top_right, bottom_right, bottom_left) = bbox
        top_left = tuple(map(int, top_left))
        bottom_right = tuple(map(int, bottom_right))
        cv2.rectangle(frame, top_left, bottom_right, (0, 0, 255), 2)  # Merah
        cv2.putText(frame, text, (top_left[0], top_left[1] - 10),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 0, 255), 2)  # Merah

    # FPS (font seragam)
    fps = 1 / (end - start)
    cv2.putText(frame, f"FPS: {fps:.2f}", (10, 30),
                cv2.FONT_HERSHEY_SIMPLEX, 0.7, (255, 0, 0), 2)

    # Tambahkan teks di kiri bawah (font seragam)
    height = frame.shape[0]
    cv2.putText(frame, "PROGRAM MENDETEKSI HURUF & ANGKA", (10, height - 40),
                cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 255), 2)
    cv2.putText(frame, "IZZUDDIN ALQASSAM || D041221049", (10, height - 15),
                cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 255), 2)

    cv2.imshow('EasyOCR Realtime', frame)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
