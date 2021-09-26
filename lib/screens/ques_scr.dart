import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiz/component/progressbar.dart';
import 'package:quiz/component/questioncard.dart';
import 'package:quiz/controller/progessbar_controller.dart';
import 'package:get/get.dart';

class QuesScreen extends StatefulWidget {
  const QuesScreen({Key key}) : super(key: key);

  @override
  _QuesScreenState createState() => _QuesScreenState();
}

class _QuesScreenState extends State<QuesScreen> {
  final QuestionController _questionController = Get.put(QuestionController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.grey[800],
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              TextButton(
                onPressed: _questionController.nextQues,
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: ProcessBar(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Obx(
                          () => Text.rich(
                            TextSpan(
                              text:
                                  "Question ${(_questionController.questionNumber.value)}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(color: Colors.grey),
                              children: [
                                TextSpan(
                                    text:
                                        "/${(_questionController.question.length)}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith(color: Colors.grey))
                              ],
                            ),
                          ),
                        )),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(
                        thickness: 2.0,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _questionController.pageController,
                        onPageChanged: _questionController.updateQuesNo,
                        itemCount: _questionController.question.length,
                        itemBuilder: (context, index) => QuestionCard(
                          question: _questionController.question[index],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
