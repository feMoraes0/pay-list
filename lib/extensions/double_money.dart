extension MoneyParsing on double {
  String asMoney() {
    int precision = 4;

    if (this < 10) {
      precision = 3;
    } else if (this >= 100 && this < 1000) {
      precision = 5;
    } else if (this >= 1000) {
      precision = 6;
    }

    return this.toStringAsPrecision(precision);
  }
}