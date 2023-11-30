import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_truth/components/custom_appbar.dart';
import 'package:truth_or_truth/components/custom_button.dart';
import 'package:truth_or_truth/components/custom_text_button.dart';
import 'package:truth_or_truth/components/custom_text_field.dart';
import 'package:truth_or_truth/home/home_controller.dart';
import 'package:truth_or_truth/utils/const.dart';
import 'package:truth_or_truth/utils/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(pageTitle: 'Home'),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(Sizes.s20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Set total player
              if (controller.numberOfPlayers == 0)
                _buildSetPlayer()
              // Need actions: Add New Question
              else if (controller.numberOfPlayers > 0 &&
                  controller.cardList.length < controller.numberOfPlayers * 3 &&
                  !controller.isAnswered)
                _buildAddQuestion()
              // Start the game
              else if (controller.numberOfPlayers > 0 &&
                  !controller.gameStarted &&
                  !controller.isAnswered)
                _buildStartGame()
              // on Game
              else if (controller.gameStarted && controller.cardList.isNotEmpty)
                _buildOnGame()
              // Finished
              else if (controller.isAnswered && controller.cardList.isEmpty)
                _buildFinished(),
            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: _checkVisibility(),
        child: FloatingActionButton(
          backgroundColor: AppColor.tersier,
          foregroundColor: AppColor.mainColor,
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              _showInputDialog();
            });
          },
        ),
      ),
    );
  }

  _checkVisibility() {
    return !controller.gameStarted && controller.numberOfPlayers != 0;
  }

  _showInputDialog() {
    TextEditingController inputController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("New Question"),
          content: CustomTextField(
            controller: inputController,
            inputLabel: "What's your question?",
          ),
          actions: [
            CustomTextButton(
              buttonLabel: "Cancel",
              textButtonType: TextButtonType.tersier,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CustomTextButton(
              buttonLabel: "Submit",
              onPressed: () {
                String newCardContent = inputController.text;
                if (newCardContent.isNotEmpty) {
                  setState(() {
                    controller.cardList.add(newCardContent);
                  });
                }
                Navigator.of(context).pop(); // Tutup dialog
              },
            ),
          ],
        );
      },
    );
  }

  _buildSetPlayer() {
    return Column(
      children: [
        Text(
          "Wanna start the game?",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: Sizes.s15),
        Text(
          "Click the \"Setup Player\" button to set how many player will join this game",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: Sizes.s15),
        CustomTextField(
          controller: controller.playersController,
          inputLabel: "Total of Player",
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: Sizes.s15),
        CustomButton(
          buttonLabel: 'Setup Player',
          onPressed: () {
            setState(() {
              controller.numberOfPlayers =
                  int.parse(controller.playersController.text);
            });
          },
        )
      ],
    );
  }

  _buildAddQuestion() {
    return Column(
      children: [
        Text(
          "Want to start the game?",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: Sizes.s20),
        Text(
          "Then, add some questions by click the \"+\" button down there",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: Sizes.s5),
        Text(
          'Minimum questions = player * 3 card',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColor.tersier),
        ),
        const SizedBox(height: Sizes.s20),
        Text(
          'Current total created questions = ${controller.cardList.length}',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }

  _buildStartGame() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Ready to start the game?",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: Sizes.s30),
        CustomButton(
          buttonLabel: "Start The Game",
          onPressed: () {
            setState(() {
              controller.gameStarted = true;
              controller.cardList.shuffle();
            });
          },
        ),
        const SizedBox(height: Sizes.s30),
        Text(
          'Current total created questions = ${controller.cardList.length}',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }

  _buildOnGame() {
    List<Widget> cardWidgets = [];
    if (controller.cardList.length >= 3) {
      for (int i = 0; i < 3; i++) {
        cardWidgets.add(
          InkWell(
            onTap: () {
              _showCardDialog(i + 1, controller.cardList[i]);
            },
            child: Card(
              margin: EdgeInsets.all(Sizes.s15),
              child: Padding(
                padding: const EdgeInsets.all(Sizes.s50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Card ${i + 1}"),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    } else {
      for (int i = 0; i < controller.cardList.length; i++) {
        cardWidgets.add(
          InkWell(
            onTap: () {
              _showCardDialog(i + 1, controller.cardList[i]);
            },
            child: Card(
              margin: EdgeInsets.all(Sizes.s15),
              child: Padding(
                padding: const EdgeInsets.all(Sizes.s50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Card ${i + 1}"),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }

    return Column(
      children: [
        Text(
          "Choose one card, please",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: Sizes.s30),
        Column(
          children: cardWidgets,
        ),
        const SizedBox(height: Sizes.s30),
        Text(
          'Current total created questions = ${controller.cardList.length}',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }

  _buildFinished() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Game Over",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: Sizes.s30),
        CustomButton(
          buttonLabel: "Reset",
          onPressed: () {
            setState(() {
              controller.resetHomePageValues();
            });
          },
        ),
      ],
    );
  }

  _showCardDialog(int cardNumber, String cardContent) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Card $cardNumber"),
          content: Text(cardContent),
          actions: [
            if (controller.cardList.isNotEmpty)
              TextButton(
                onPressed: () {
                  _removeCard(cardNumber);
                  Navigator.of(context).pop();
                },
                child: const Text("Answered"),
              ),
          ],
        );
      },
    );
  }

  _removeCard(int cardNumber) {
    setState(() {
      if (controller.cardList.isNotEmpty) {
        controller.isAnswered = true;
        controller.cardList.removeAt(cardNumber - 1);
      }
    });
  }
}
