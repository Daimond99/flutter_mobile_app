
---
# Travel App (Flutter Project)

แอปพลิเคชันท่องเที่ยว ที่พัฒนาด้วย **Flutter** รองรับฟีเจอร์การสมัครสมาชิก, เข้าสู่ระบบ, แก้ไขข้อมูลส่วนตัว, ดูรายการทริป และรายละเอียดทริป

---

## Features

* Authentication: ลงทะเบียน / เข้าสู่ระบบ / ลบสมาชิก
* User Profile: แก้ไขโปรไฟล์, ดูข้อมูลผู้ใช้
* Trips: แสดงรายการทริป, ค้นหาตามหมวดหมู่, แสดงรายละเอียดแต่ละทริป
* API : ดึงข้อมูลจาก Backend ผ่าน Node.js

---

## Project Structure

```bash
lib/model/
├── api/                      # โมเดลสำหรับสื่อสารกับ Backend (ตามโครงสร้าง API)
│   ├── trip_model.dart       # โมเดล Trip จาก API + ยูทิลิตี้ที่เกี่ยวข้อง
│   ├── customer_login_request.dart
│   └── customer_login_response.dart
├── data/                     # โมเดลฝั่ง UI/View (ข้อมูลที่พร้อมแสดงผล)
│   └── trip_data.dart        # คลาส TripData สำหรับ UI
└── models.dart               # Barrel export
```

---

## Screenshots

### Authentication

| Login                                                                                                                              | Register                                                                                                                              |
| ---------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| <img width="486" height="861" alt="login" src="https://github.com/user-attachments/assets/d46aa489-cb2e-4c39-b58a-56c6c55d84d7" /> | <img width="486" height="866" alt="register" src="https://github.com/user-attachments/assets/cb82ab2c-e1ee-410f-a53a-e8f5f9ef75bd" /> |

---

### User Profile

| Profile                                                                                                                                   | Delete Profile                                                                                                                           |
| ----------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| <img width="483" height="882" alt="edit profile" src="https://github.com/user-attachments/assets/196b31e1-86bf-499a-a43f-66997d89dffd" /> | <img width="417" height="846" alt="delete user" src="https://github.com/user-attachments/assets/e84dc3c4-cd63-429c-a103-82d8e591c8a3" /> |

---

### Trips

| Trip List                                                                                                                                    | Trip Detail                                                                                                                                   |
| -------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| <img width="472" height="882" alt="main show trips" src="https://github.com/user-attachments/assets/7182b371-e839-4a3a-ae56-a48bc1258d85" /> | <img width="437" height="847" alt="showdetail trips" src="https://github.com/user-attachments/assets/03ce736c-e019-4d9d-a17c-2dc547bc62d5" /> |

---

## API Config

<img width="857" height="648" alt="api database set" src="https://github.com/user-attachments/assets/28b727ae-4084-42a6-abec-99e374b306bd" />

---

## Author

* Student Project - Mahasarakham University
* Created by: **Panuwat yodta (65011212126)**

---
