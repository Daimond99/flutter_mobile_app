# flutter\_ui\_1

UI แอป **Flutter** (เชื่อมต่อ **Backend: Node.js + SQLite** สำหรับเดโม/ทดสอบ)
> ถ้าโปรเจกต์นี้มีเฉพาะ Flutter ให้ข้ามส่วน “รันฐานข้อมูล/Backend” ได้
---
## โครงสร้างโปรเจกต์ (โดยรวม)
```
root/
├─ flutter_ui_1/               # โค้ดแอป Flutter
│  ├─ lib/                     # หน้าจอ/บริการเรียก API
│  ├─ android/ ios/ web/       # ไฟล์แพลตฟอร์ม
│  └─ pubspec.yaml
│
└─ backend/                    # (ถ้ามี) Node.js + Express + SQLite
   ├─ src/                     # app.js / routes / controllers
   ├─ db/
   │  ├─ dev.db                # ฐานข้อมูลตัวอย่าง (ตัวเลือก)
   │  └─ seed.sql              # สคริปต์สร้าง/ใส่ข้อมูลเริ่มต้น (ตัวเลือก)
   ├─ .env.example
   └─ package.json
```

---

## รันฐานข้อมูล + Backend (Node.js + SQLite)

**ความต้องการ:** Node.js v18+, npm/pnpm/yarn (และถ้าจะใช้ `seed.sql` ให้มี `sqlite3` CLI)

```bash
cd backend
npm i
cp .env.example .env
```

ตัวอย่าง `.env`:

```env
PORT=3000
DATABASE_URL="file:./db/dev.db"
NODE_ENV=development
```

เลือก **หนึ่ง** วิธี:

### วิธี A — ใช้ไฟล์ `db/dev.db` ที่มีอยู่ (ง่าย/ไว)

```bash
npm run dev      # หรือ npm start
# API: http://localhost:3000
```

### วิธี B — สร้าง DB จาก `seed.sql`

```bash
mkdir -p db
sqlite3 db/dev.db < db/seed.sql
npm run dev
# API: http://localhost:3000
```

> ถ้าโปรเจกต์ใช้เครื่องมือ migrations/seed (Prisma/Knex/Sequelize) ให้รันคำสั่งตามสคริปต์จริงใน `package.json`

---

## ให้ Flutter เชื่อมต่อกับ Backend

* ตั้งค่า **API base URL** ในโค้ด/ตอนรัน:

  * Android Emulator: `http://10.0.2.2:3000`
  * อุปกรณ์จริง/เว็บ: `http://<IP-เครื่อง-backend>:3000` หรือ `http://localhost:3000`

ตัวอย่างกำหนดตอนรัน:
```bash
flutter run --dart-define=API_BASE=http://10.0.2.2:3000
# หรือ build:
# flutter build apk --dart-define=API_BASE=http://10.0.2.2:3000
```

ในโค้ด (ตัวอย่าง):

```dart
const apiBase = String.fromEnvironment(
  'API_BASE',
  defaultValue: 'http://10.0.2.2:3000',
);
```
---

## รันแอป Flutter
```bash
cd flutter_ui_1
flutter pub get
flutter run
```
