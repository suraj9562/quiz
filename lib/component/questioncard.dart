import 'package:flutter/material.dart';
import 'package:quiz/component/option.dart';
import 'package:quiz/controller/progessbar_controller.dart';
import 'package:quiz/questions.dart';
import 'package:get/get.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key key, this.question}) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Column(
          children: [
            Text(
              question.question,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 10.0,
            ),
            ...List.generate(
                question.options.length,
                (index) => Option(
                    text: question.options[index], index: index, press:() => _controller.checkAns(question, index)))
          ],
        ),
      ),
    );
  }
}
