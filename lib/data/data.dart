import '../model/quiz_model.dart';

List<QuizModel> questions = [
  QuizModel(
      correctAnswerIndex: 2,
      imagesUrls: [
        "assets/animal images/butterfly.png",
        "assets/animal images/cow.png",
        "assets/animal images/duck.png",
        "assets/animal images/panda.png",
      ],
      urlToSound: "assets/animal sounds/duck.mp3",
  ),
  QuizModel(
      correctAnswerIndex: 1,
      imagesUrls: [
        "assets/animal images/butterfly.png",
        "assets/animal images/cow.png",
        "assets/animal images/duck.png",
        "assets/animal images/panda.png",
      ],
      urlToSound: "assets/animal sounds/cow.mp3",
  ),
  QuizModel(
      correctAnswerIndex: 3,
      imagesUrls: [
        "assets/animal images/butterfly.png",
        "assets/animal images/cow.png",
        "assets/animal images/duck.png",
        "assets/animal images/elephant.png",
      ],
      urlToSound: "assets/animal sounds/elephant.mp3",
  ),
];