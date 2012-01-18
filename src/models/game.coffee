class FloodIt.Game
  constructor: () ->
    @rowCount = 10;
    @columnCount = 20;
    @colorsCount = 4;
    @playGround = null;
    @playersCount = 2;
    @players = [
      new FloodIt.Player("Player1"),
      new FloodIt.Player("Player2")
    ];
    @currentPlayerId = 0;
