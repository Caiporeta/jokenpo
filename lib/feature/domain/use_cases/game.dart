import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:jokenpo/feature/domain/entities/game_choice.dart';
import 'package:jokenpo/feature/domain/entities/game_results.dart';
import 'package:jokenpo/feature/domain/entities/gameplay.dart';

class Game {
  GameResults _getGameResults(
    Gameplay app,
    Gameplay user,
  ) {
    GameResults results;

    if (app.play.choice == user.play.choice) {
      results = _tieResult();
    } else {
      String winner = _classifyResults(
        app,
        user,
      );
      results = _winLoseResult(winner);
    }

    return results;
  }

  GameResults _tieResult() {
    Map<String, String> results = {
      Player.appPlayer: Result.tie,
      Player.userPlayer: Result.tie,
    };

    return GameResults(results);
  }

  String _classifyResults(
    Gameplay app,
    Gameplay user,
  ) {
    /*
   pedra > tesoura > papel > pedra 
   1      > 2       > 3     > 1
   */
    String winner = '';
    bool _appWinner =
        app.play.choice == "pedra" && user.play.choice == "tesoura" ||
            app.play.choice == "tesoura" && user.play.choice == "papel" ||
            app.play.choice == "papel" && user.play.choice == "pedra";

    if (_appWinner) {
      winner = Player.appPlayer;
    } else {
      winner = Player.userPlayer;
    }

    return winner;
  }

  GameResults _winLoseResult(winner) {
    Map<String, String> results = {};

    switch (winner) {
      case Player.appPlayer:
        results = {
          Player.appPlayer: Result.win,
          Player.userPlayer: Result.lose,
        };
        break;

      case Player.userPlayer:
        results = {
          Player.appPlayer: Result.lose,
          Player.userPlayer: Result.win,
        };
        break;
    }

    return GameResults(results);
  }

  Image _getChoiceImage(GameChoice playerChoice) {
    String imageName = '';

    switch (playerChoice.choice) {
      case "pedra":
        imageName = "assets/pedra.png";
        break;

      case "papel":
        imageName = "assets/papel.png";
        break;

      case "tesoura":
        imageName = "assets/tesoura.png";
        break;
    }

    return Image.asset(imageName);
  }

  GameChoice _appGameChoice() {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    GameChoice appChoice = GameChoice();
    appChoice.choice = escolhaApp;

    return appChoice;
  }

  void processGame(GameChoice userChoice,
      void Function(GameResults results, Image appImage) gameSetupCallback) {
    final GameChoice appChoice = _appGameChoice();
    appChoice.appImage = _getChoiceImage(appChoice);

    Gameplay appPlay = Gameplay(
      play: appChoice,
    );
    Gameplay userPlay = Gameplay(
      play: userChoice,
    );

    final GameResults _results = _getGameResults(
      appPlay,
      userPlay,
    );

    gameSetupCallback.call(_results, appChoice.appImage);
  }
}
