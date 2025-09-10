lib/model/
├── api/                      # โมเดลสำหรับสื่อสารกับ Backend (ตามโครงสร้าง API)
│   ├── trip_model.dart       # โมเดล Trip จาก API + ยูทิลิตี้ที่เกี่ยวข้อง
│   ├── customer_login_request.dart
│   └── customer_login_response.dart
├── data/                     # โมเดลฝั่ง UI/View (ข้อมูลที่พร้อมแสดงผล)
│   └── trip_data.dart        # คลาส TripData สำหรับ UI
└── models.dart               # Barrel export รวมทุกโมเดลให้นำเข้าไฟล์เดียว
