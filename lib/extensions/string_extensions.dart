import 'dart:convert';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:shamsi_date/shamsi_date.dart' as shmsi;
import 'package:hijri_calendar/hijri_calendar.dart' as hijri;

extension StringExtensions on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  bool containsDigit() => RegExp(r'[0-9]').hasMatch(this);

  bool isValidEmail() => RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  ).hasMatch(this);

  String mask({int start = 4, int end = 4, String maskChar = '*'}) {
    if (length <= start + end) return this;
    return substring(0, start) +
        maskChar * (length - start - end) +
        substring(length - end);
  }
}

extension SecureExtensions on String {
  static final String _aesKey = 'ABC0123456789DEF56789ABC01234DEF';
  static final String _aesIV = 'AB0123CD456EF789';

  String encryptAes() {
    try {
      final key = enc.Key(Utf8Encoder().convert(_aesKey));
      final iv = enc.IV(Utf8Encoder().convert(_aesIV));

      final aes = enc.Encrypter(
        enc.AES(key, mode: enc.AESMode.cbc, padding: 'PKCS7'),
      );

      final encrypted = aes.encrypt(this, iv: iv);
      return encrypted.base64;
    } catch (_) {
      return '';
    }
  }

  String decryptAes() {
    try {
      String input = this;

      final key = enc.Key(Utf8Encoder().convert(_aesKey));
      final iv = enc.IV(Utf8Encoder().convert(_aesIV));

      final aes = enc.Encrypter(
        enc.AES(key, mode: enc.AESMode.cbc, padding: 'PKCS7'),
      );

      final decrypted = aes.decrypt(enc.Encrypted.fromBase64(input), iv: iv);
      return decrypted;
    } catch (_) {
      return '';
    }
  }
}

extension PersianExtensions on String {
  String en2fa() {
    const enToFa = {
      '0': '۰',
      '1': '۱',
      '2': '۲',
      '3': '۳',
      '4': '۴',
      '5': '۵',
      '6': '۶',
      '7': '۷',
      '8': '۸',
      '9': '۹',
    };
    return split('').map((c) => enToFa[c] ?? c).join();
  }

  String fa2en() {
    if (isEmpty) return this;
    const faToEn = {
      // فارسی
      '۰': '0', '۱': '1', '۲': '2', '۳': '3', '۴': '4',
      '۵': '5', '۶': '6', '۷': '7', '۸': '8', '۹': '9',
      // عربی
      '٠': '0', '١': '1', '٢': '2', '٣': '3', '٤': '4',
      '٥': '5', '٦': '6', '٧': '7', '٨': '8', '٩': '9',
    };
    return split('').map((c) => faToEn[c] ?? c).join().trim();
  }

  String fixPersianChars() {
    return replaceAll('ﮎ', 'ک')
        .replaceAll('ﮏ', 'ک')
        .replaceAll('ﮐ', 'ک')
        .replaceAll('ﮑ', 'ک')
        .replaceAll('ك', 'ک')
        .replaceAll('ي', 'ی')
        .replaceAll(' ', ' ')
        .replaceAll('‌', ' ')
        .replaceAll('ھ', 'ه');
  }

  DateTime toGregorian() {
    final parts = split('/');
    final year = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final day = int.parse(parts[2]);
    final jDate = shmsi.Jalali(year, month, day);
    return jDate.toDateTime();
  }
}

extension PersianDateTimeExtensions on DateTime {
  String toPersianDate() {
    final j = shmsi.Jalali.fromDateTime(this);
    return '${j.year.toString().padLeft(4, '0')}/${j.month.toString().padLeft(2, '0')}/${j.day.toString().padLeft(2, '0')}';
  }

  String toPersianDateTime() {
    final j = shmsi.Jalali.fromDateTime(this);
    final dateStr =
        '${j.year.toString().padLeft(4, '0')}/${j.month.toString().padLeft(2, '0')}/${j.day.toString().padLeft(2, '0')}';
    final timeStr =
        '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';
    return '$dateStr $timeStr';
  }
}

extension HijriDateExtensions on DateTime {
  String toHijriDate({String locale = 'ar', String sep = '/'}) {
    hijri.HijriCalendarConfig.setLocal(locale); // 'ar' یا 'en'
    final h = hijri.HijriCalendarConfig.fromGregorian(this);
    return '${h.hYear.toString().padLeft(4, '0')}$sep'
        '${h.hMonth.toString().padLeft(2, '0')}$sep'
        '${h.hDay.toString().padLeft(2, '0')}';
  }

  String toHijriWithMonthName({String locale = 'ar'}) {
    hijri.HijriCalendarConfig.setLocal(locale);
    final h = hijri.HijriCalendarConfig.fromGregorian(this);
    return '${h.hDay} ${h.getLongMonthName()} ${h.hYear}';
  }
}
