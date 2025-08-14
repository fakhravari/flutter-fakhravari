extension IntExtensions on int {
  String formatWithCommas() {
    return toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  bool isEvenNumber() => this % 2 == 0;
  bool isOddNumber() => this % 2 != 0;

  String toTimeString() {
    final minutes = this ~/ 60;
    final seconds = this % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

extension DoubleExtensions on double {
  String toStringAsFixedTrimmed(int fractionDigits) {
    String str = toStringAsFixed(fractionDigits);
    if (str.contains('.')) {
      str = str.replaceAll(RegExp(r'0*$'), '').replaceAll(RegExp(r'\.$'), '');
    }
    return str;
  }

  double metersToFeet() => this * 3.28084;
  double kmToMiles() => this * 0.621371;
}
