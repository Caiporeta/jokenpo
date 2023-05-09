import 'package:flutter/material.dart';
import 'package:jokenpo/feature/domain/entities/game_choice.dart';

class UserChoice extends StatefulWidget {
  final String text;
  void Function(GameChoice userPlay) callback;

  UserChoice({
    Key? key,
    required this.text,
    required this.callback,
  }) : super(key: key);

  @override
  State<UserChoice> createState() => _UserChoiceState();
}

class _UserChoiceState extends State<UserChoice> {
  GameChoice userChoice = GameChoice();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.text,
            style: const TextStyle(color: Colors.black87, fontSize: 25),
          ),
        ), //resultado : selecione sua jogada - Voce Ganhou! :D - Voce perdeu :(
        SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Image.asset("assets/papel.png"),
                onTap: () {
                  userChoice.choice = "papel";
                  widget.callback.call(userChoice);
                },
              ),
              GestureDetector(
                child: Image.asset("assets/pedra.png"),
                onTap: () {
                  userChoice.choice = "pedra";
                  widget.callback.call(userChoice);
                },
              ),
              GestureDetector(
                child: Image.asset("assets/tesoura.png"),
                onTap: () {
                  userChoice.choice = "tesoura";
                  widget.callback.call(userChoice);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
