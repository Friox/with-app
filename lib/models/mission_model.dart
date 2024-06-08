class Mission {
  final String title;
  final String? family;
  final String? familyUID;
  final bool isFinished;

  Mission({
    required this.title,
    this.family,
    this.familyUID,
    this.isFinished = false
  });
}