import 'dart:async';

import 'package:app_testing_before_session/data/data.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  Map<int,int> userChoices = {};
  PageController pageController = PageController();

  int _start = 60;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer(){
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      if(_start == 0){
        setState(() {
          pageController.nextPage(
              duration: const Duration(
                seconds: 1
              ),
              curve: Curves.linear,
          );
          _start = 60;
          _startTimer();
          _timer.cancel();
        });
      }
      else{
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Sound Quiz",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    Text(
                      "Question(${i + 1} / ${questions.length})",
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                        assetsAudioPlayer.open(
                          Audio(questions[i].urlToSound),
                        );
                        assetsAudioPlayer.play();
                      },
                      icon: const Icon(
                        Icons.volume_up,
                        color: Colors.black,
                      ),
                      iconSize: 72.0,
                    ),
                    const Text(
                      "Press here to hear sound",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 20.0,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              userChoices[i] = index;
                              pageController.nextPage(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.linear,
                              );

                              // to restart timer again
                              _start = 60;
                              _startTimer();

                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: userChoices[i] == null ?
                                  Colors.blueGrey.shade200:
                                  userChoices[i] == index ? Colors.blue:Colors.blueGrey.shade200,
                                  borderRadius: BorderRadius.circular(12.0)
                              ),
                              child: Image(
                                image: AssetImage(
                                  questions[i].imagesUrls[index],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      "Remaining time : $_start seconds",
                      style: TextStyle(
                        color: _start < 10 ?Colors.red.shade900:Colors.blue.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                );
              },
            itemCount: questions.length,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ),
      ),
    );
  }
}
