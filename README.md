# SeerE — OBD-II Car Diagnostics (Flutter)

SeerE is a Flutter mobile app that connects to an **OBD-II** adapter over **Bluetooth** to read live vehicle telemetry and **predict potential car issues**. Built as a graduation project by Mansoura University students.


---

## ✨ Features

- **Bluetooth OBD-II connection** (ELM327-compatible adapters)
- **Live telemetry** (e.g., RPM, speed, coolant temperature, fuel data)*
- **Trouble codes (DTCs)**: read/interpret common codes*
- **Issue prediction** based on collected telemetry
- **History & caching** of recent readings*
- **Responsive Flutter UI**

---

## 🛠️ Tech Stack

- **Flutter / Dart**
- **Bluetooth (Classic)** for OBD-II adapters
- Modular architecture with clear separation of layers

---

## 🎥 Demo Videos

- [Video 1](https://github.com/user-attachments/assets/1241d29e-ba7d-4fb9-b74b-4342ee41c08a)
- [Video 2](https://github.com/user-attachments/assets/3a6fd1f6-ce14-4f04-9428-bab028fa4286)
- [Video 3](https://github.com/user-attachments/assets/6a4b73ab-481d-4189-b259-d71b85a83a6e)

---

## 🔌 Requirements

- **Android 8.0+** (OBD-II over Bluetooth works best on Android)
- **ELM327-compatible Bluetooth OBD-II adapter**
- **Flutter 3.x** (install from [flutter.dev](https://flutter.dev))
- Bluetooth & Location permissions enabled

---

## 🚀 Getting Started

```bash
# 1) Clone
git clone https://github.com/Rana-Mohsen/seere.git
cd seere

# 2) Install dependencies
flutter pub get

# 3) Run on a device
flutter run

