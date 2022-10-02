extension StringExtension on String {
  String capitalizator() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
