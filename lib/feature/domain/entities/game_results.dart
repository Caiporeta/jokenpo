class GameResults {
  Map<String, String> results;

  GameResults(this.results);
}

class Player {
  Player._();

  static const String appPlayer = "App";
  static const String userPlayer = "User";
}

class Result {
  Result._();

  static const String win = "Voce ganhou! :D";
  static const String lose = "Voce perdeu :(";
  static const String tie = "Foi empate!";
}
