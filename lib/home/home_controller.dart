import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  List<String> cardList = [];
  int numberOfPlayers = 0;
  int currentCardIndex = 0;
  bool gameStarted = false;
  String selectedCard = "";
  bool isAnswered = false;

  TextEditingController playersController = TextEditingController();
  TextEditingController inputController = TextEditingController();

  void resetHomePageValues() {
    cardList.clear();
    numberOfPlayers = 0;
    currentCardIndex = 0;
    gameStarted = false;
    selectedCard = "";
    isAnswered = false;
    playersController.text = '';
    inputController.text = '';

    update();
  }
}
