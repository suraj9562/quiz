import 'package:flutter/material.dart';
import 'package:quiz/controller/progessbar_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Option extends StatelessWidget {
  const Option({
    Key key,
    this.text,
     this.index,
     this.press,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qncontroller) {
          Color getCorrectColor() {
            if (qncontroller.isAnswered) {
              if (index == qncontroller.correctAns) {
                return Colors.green;
              } else if (index == qncontroller.selectedAns &&
                  qncontroller.selectedAns != qncontroller.correctAns) {
                return Colors.red;
              }
            }
            return Colors.black26;
          }

          IconData getCorrectIcon() {
            return getCorrectColor() == Colors.red ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  border: Border.all(color: getCorrectColor()),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${index + 1} $text",
                    style: TextStyle(color: getCorrectColor(), fontSize: 16.0),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                        color: getCorrectColor() == Colors.black26
                            ? Colors.transparent
                            : getCorrectColor(),
                        border: Border.all(color: getCorrectColor()),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: Icon(
                      getCorrectIcon(),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
