import 'dart:math';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:quiz/controller/progessbar_controller.dart';
import 'package:get/get.dart';
import 'package:quiz/screens/home.dart';

class ScoreScren extends StatefulWidget {
  const ScoreScren({Key key}) : super(key: key);

  @override
  State<ScoreScren> createState() => _ScoreScrenState();
}

class _ScoreScrenState extends State<ScoreScren> {
  ConfettiController confettiController;

  @override
  void initState() {
    confettiController =
        ConfettiController(duration: const Duration(milliseconds: 500));
    confettiController.play();
    super.initState();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
            child: const Text(
              "Go To Home",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: confettiController,
              shouldLoop: true,
              blastDirection: pi / 2,
              gravity: 0.02,
              numberOfParticles: 50,
              emissionFrequency: 0.02,
              displayTarget: true,
              blastDirectionality: BlastDirectionality.explosive,
              colors: const [
                Colors.redAccent,
                Colors.amberAccent,
                Colors.greenAccent,
                Colors.blueAccent,
                Colors.pinkAccent,
                Colors.indigoAccent,
                Colors.orangeAccent
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "${_controller.numOfCorrectAns * 10}/${_controller.question.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.white),
              ),
              const Spacer()
            ],
          )
        ],
      ),
    );
  }
}
