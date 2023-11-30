import 'package:flutter/material.dart';
import 'package:truth_or_truth/components/custom_appbar.dart';
import 'package:truth_or_truth/components/custom_button.dart';
import 'package:truth_or_truth/components/custom_text_field.dart';
import 'package:truth_or_truth/utils/const.dart';
import 'package:truth_or_truth/utils/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> cardList = [];
  int numberOfPlayers = 0;
  int currentCardIndex = 0;
  bool isGameStarted = false;
  String selectedCard = "";

  TextEditingController playersController = TextEditingController();

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
              if (numberOfPlayers == 0)
                Column(
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
                      controller: playersController,
                      inputLabel: "Total of Player",
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: Sizes.s15),
                    CustomButton(
                      buttonLabel: 'Setup Player',
                      onPressed: () {
                        setState(() {
                          numberOfPlayers = int.parse(playersController.text);
                        });
                      },
                    )
                  ],
                ),
              // Need actions: Add New Question
              if (numberOfPlayers > 0 && cardList.length < numberOfPlayers * 3)
                Column(
                  children: [
                    Text(
                      "Wanna start the game?",
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
                      'Current total created questions = ${cardList.length}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              // Start the game
              if (numberOfPlayers > 0 &&
                  cardList.length >= numberOfPlayers * 3 &&
                  isGameStarted == false)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already to start the game?",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: Sizes.s30),
                    CustomButton(
                        buttonLabel: "Start The Game",
                        onPressed: () {
                          setState(() {
                            isGameStarted = true;
                            cardList.shuffle();
                          });
                        })
                  ],
                ),
              // on Game
              if (isGameStarted == true)
                Expanded(
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text("${cardList[index]} $index"),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: !isGameStarted,
        child: FloatingActionButton(
          backgroundColor: AppColor.tersier,
          foregroundColor: AppColor.mainColor,
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              cardList.add('New Card');
            });
          },
        ),
      ),
    );
  }
}
