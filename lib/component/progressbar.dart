import 'package:flutter/material.dart';
import 'package:quiz/controller/progessbar_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class ProcessBar extends StatelessWidget {
  const ProcessBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black45, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(50.0))),
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            return Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: constraints.maxWidth * (controller.animation.value),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.green, Colors.greenAccent],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  ),
                ),
                Positioned.fill(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${(controller.animation.value * 30).round()} sec"),
                      const Icon(Icons.timer_sharp)
                    ],
                  ),
                ))
              ],
            );
          }),
    );
  }
}
