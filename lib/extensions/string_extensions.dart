import 'dart:convert';
import 'package:encrypt/encrypt.dart' as enc;

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
