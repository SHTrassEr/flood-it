class FloodIt.Game
  constructor: (rowCount, columnCount) ->
    @colorsCount = 4;
    @playGround = new FloodIt.PlayGround(rowCount, columnCount);
    @playersCount = 2;
    @players = [
      new FloodIt.Player("Player1"),
      new FloodIt.Player("Player2")
    ];
    @currentPlayerId = 0;
