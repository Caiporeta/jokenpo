import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jokenpo/feature/domain/entities/game_results.dart';
import 'package:jokenpo/feature/domain/use_cases/game.dart';
import 'package:jokenpo/feature/presentation/widgets/app_choice.dart';
import 'package:jokenpo/feature/presentation/widgets/user_choice.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("JokenPo"),
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: HomeScreenBody(),
          ),
        ));
  }
}

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final Game game = Game();

  String userLabel = "Selecione sua jogada";
  Image appChoiceImage = Image.asset("assets/padrao.png");

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AppChoice(
          image: appChoiceImage,
        ),
        UserChoice(
          text: userLabel,
          callback: (userChoice) => game.processGame(
            userChoice,
            (results, appImage) => _setUpHomeScreen(results, appImage),
          ),
        )
      ],
    );
  }

  void _setUpHomeScreen(GameResults results, Image appImage) {
    setState(() {
      appChoiceImage = appImage;
      userLabel = results.results[Player.userPlayer]!;
    });
  }
}
