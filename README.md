# Fakhravari

A collection of useful Dart and Flutter extension methods for working with **String**, **int**, **double**, **DateTime**, and **encryption**.  
This package provides helpers for formatting, validation, Persian/Arabic date conversions, and more.

---

## ✨ Features
- Format numbers with commas, check even/odd, convert seconds to time string.
- Double extensions for trimming decimals, meters to feet, km to miles.
- String extensions for capitalization, masking, email validation, etc.
- AES encryption/decryption with CBC mode.
- Persian number and character conversions.
- Convert between Persian (Jalali), Gregorian, and Hijri dates.

---

## 📦 Installation
Add this to your `pubspec.yaml`:

```yaml
dependencies:
<<<<<<< HEAD
  fakhravari: ^0.0.5
=======
  fakhravari: ^0.0.4
>>>>>>> 277e3ed47fc8d7b3d3352f63e6ea69f0213afe44
```

Then run:
```bash
flutter pub get
```

---

## 🚀 Usage Examples

### 🔢 IntExtensions
```dart
void main() {
  print(1234567.formatWithCommas()); // 1,234,567
  print(4.isEvenNumber()); // true
  print(5.isOddNumber()); // true
  print(125.toTimeString()); // 02:05
}
```

---

### 🔢 DoubleExtensions
```dart
void main() {
  print(12.3400.toStringAsFixedTrimmed(3)); // 12.34
  print(10.0.metersToFeet()); // 32.8084
  print(5.0.kmToMiles()); // 3.106855
}
```

---

### 🔤 StringExtensions
```dart
void main() {
  print('hello'.capitalize()); // Hello
  print('abc123'.containsDigit()); // true
  print('test@example.com'.isValidEmail()); // true
  print('1234567890'.mask()); // 1234****90
}
```

---

### 🔐 SecureExtensions (AES Encrypt/Decrypt)
```dart
void main() {
  final encrypted = 'HelloWorld'.encryptAes();
  print(encrypted); // متن رمزنگاری شده

  final decrypted = encrypted.decryptAes();
  print(decrypted); // HelloWorld
}
```

---

### 🇮🇷 PersianExtensions
```dart
void main() {
  print('123456'.en2fa()); // ۱۲۳۴۵۶
  print('۱۲۳۴۵۶'.fa2en()); // 123456
  print('يكد'.fixPersianChars()); // یکد
  print('1403/05/16'.toGregorian()); // 2024-08-06 00:00:00.000
}
```

---

### 🗓 PersianDateTimeExtensions
```dart
void main() {
  final now = DateTime.now();
  print(now.toPersianDate()); // 1403/05/16
  print(now.toPersianDateTime()); // 1403/05/16 14:23:45
}
```

---

### 🕌 HijriDateExtensions
```dart
void main() {
  final now = DateTime.now();
  print(now.toHijriDate()); // 1446/01/22
  print(now.toHijriWithMonthName()); // 22 Muharram 1446
}
```

---

## 📜 License
MIT License © 2025 Mohammad Hossein Fakhravari
