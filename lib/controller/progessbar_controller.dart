import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/questions.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz/screens/score.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController _animationController;
  Animation _animation;
  // ignore: unnecessary_this
  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  final List<Question> _questions = sample_data
      .map((question) => Question(
          id: question['id'],
          question: question['question'],
          answer: question['answer_index'],
          options: question['options']))
      .toList();

  List<Question> get question => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAns;
  int get correctAns => this._correctAns;

  int _selectedAns;
  int get selectedAns => this._selectedAns;

  // for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  @override
  void onInit() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 30));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward().whenComplete(nextQues);
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;
    if (_correctAns == _selectedAns) _numOfCorrectAns++;
    _animationController.stop();
    update();

    Future.delayed(const Duration(seconds: 2), () {
      nextQues();
    });
  }

  void nextQues() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete(nextQues);
    } else {
      Get.to(const ScoreScren()).then((val) => update([
            _isAnswered = false,
            _numOfCorrectAns = 0,
            _questionNumber = 1.obs,
            _pageController.initialPage,
          ]));
    }
  }

  void updateQuesNo(int index) {
    _questionNumber.value = index + 1;
  }

  void startAgain() {
    _numOfCorrectAns = 0;
    _questionNumber.value = 1;
    nextQues();
    update();
  }
}
