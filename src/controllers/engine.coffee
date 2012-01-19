class FloodIt.Engine
  @step: (game, selectedValue) ->
    FloodIt.core.flood(
      game.playGround,
      game.players[game.currentPlayerId].startPoint,
      selectedValue
    );
    FloodIt.Engine.switchPlayer(game);

  @switchPlayer: (game) ->
    if (game.currentPlayerId < game.playersCount - 1)
      game.currentPlayerId++
    else
      game.currentPlayerId = 0;
