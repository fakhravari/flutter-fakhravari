# Fakhravari

A collection of powerful and practical Dart **extension methods** for `String`, `int`, `double`, and `DateTime`.  
This package helps you handle **string manipulation, date conversions (Gregorian ↔ Jalali/Hijri), Persian/Arabic number conversion, AES encryption, and numeric formatting** easily.

---

## ✨ Features
- **String Utilities**  
  - Capitalization, masking, digit/email validation  
  - Persian ↔ English number conversion  
  - Persian character normalization  
- **Date Utilities**  
  - Gregorian ↔ Jalali conversion  
  - Gregorian ↔ Hijri conversion (Umm al-Qura calendar)  
  - Date formatting with/without time  
- **Security Utilities**  
  - AES Encryption & Decryption (CBC + PKCS7)  
- **Number Utilities**  
  - Integer formatting with commas  
  - Even/Odd checks  
  - Time formatting (minutes:seconds)  
  - Double conversion (meters → feet, km → miles)  

---

## 📦 Installation
Add this to your `pubspec.yaml`:
```yaml
dependencies:
  fakhravari: ^0.0.1




## 🚀 Usage Examples
 🚀 Usage Examples
String Extensions
print('hello WORLD'.capitalize()); // Hello world
print('abc123'.containsDigit());    // true
print('test@example.com'.isValidEmail()); // true
print('1234567890'.mask());         // 1234****90
print('12345'.en2fa());  // ۱۲۳۴۵
print('۱۲۳۴۵'.fa2en());  // 12345
print('كريم يحيى'.fixPersianChars()); // کریم یحیی

AES Encryption & Decryption
final encrypted = 'Hello AES'.encryptAes();
print(encrypted); // Base64 string

final decrypted = encrypted.decryptAes();
print(decrypted); // Hello AES

Jalali (Persian) Date Conversion
final now = DateTime.now();
print(now.toPersianDate());      // 1404/05/24
print(now.toPersianDateTime());  // 1404/05/24 21:30:15
print('1404/05/24'.toGregorian()); // 2025-08-15

Hijri (Islamic) Date Conversion
print(now.toHijriDate());          // 1447/02/20
print(now.toHijriWithMonthName()); // 20 صفر 1447

Integer & Double Extensions
final number = 1234567;
print(number.formatWithCommas()); // 1,234,567
print(4.isEvenNumber());          // true
print(5.isOddNumber());           // true
print(125.toTimeString());        // 02:05

final value = 123.4500;
print(value.toStringAsFixedTrimmed(4)); // 123.45
print(10.0.metersToFeet());             // 32.8084
print(5.0.kmToMiles());                  // 3.106855

⚠️ Notes

AES: Uses CBC mode with PKCS7 padding, 256-bit key, and 128-bit IV.

Hijri Conversion: Based on hijri_calendar package.

Jalali Conversion: Based on shamsi_date package.

Number Formatting: Integer and double helpers for common formatting/conversion.
