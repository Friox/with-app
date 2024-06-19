class Diary {
  final DateTime date;
  final bool isFinished;
  final String? title;
  final String? summary;
  final String writer;
  final int sentiment;

  Diary({
    required this.date,
    this.isFinished = false,
    this.title,
    this.summary,
    required this.writer,
    this.sentiment = 0
  });
}