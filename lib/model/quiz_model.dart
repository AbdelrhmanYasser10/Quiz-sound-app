class QuizModel {
  late String urlToSound;
  late List<String> imagesUrls;
  late int correctAnswerIndex;

  QuizModel({
    required this.correctAnswerIndex,
    required this.imagesUrls,
    required this.urlToSound,
  });
}
