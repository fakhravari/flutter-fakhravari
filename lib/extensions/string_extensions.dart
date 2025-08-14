extension StringExtensions on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  bool containsDigit() => RegExp(r'[0-9]').hasMatch(this);

  bool isValidEmail() => RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  ).hasMatch(this);

  int toInt() => int.tryParse(this) ?? 0;
  double toDouble() => double.tryParse(this) ?? 0.0;

  String removeExtraSpaces() => trim().replaceAll(RegExp(r'\s+'), ' ');

  String mask({int start = 4, int end = 4, String maskChar = '*'}) {
    if (length <= start + end) return this;
    return substring(0, start) +
        maskChar * (length - start - end) +
        substring(length - end);
  }
}
