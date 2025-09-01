root/
├─ flutter_ui_1/               # โค้ดแอป Flutter
│  ├─ lib/                     # หน้าจอ UI, service เรียก API
│  ├─ android/ ios/ web/       # ไฟล์แพลตฟอร์ม
│  └─ pubspec.yaml             # รายการ dependencies Flutter
│
└─ backend/                    # (ถ้ามี) Node.js + Express + SQLite
   ├─ src/                     # route / controller / app.js
   ├─ db/
   │  ├─ dev.db                # ฐานข้อมูลตัวอย่าง (ตัวเลือก)
   │  └─ seed.sql              # สร้าง/ใส่ข้อมูลเริ่มต้น (ตัวเลือก)
   ├─ .env.example             # ตัวอย่างตัวแปรแวดล้อม
   └─ package.json
