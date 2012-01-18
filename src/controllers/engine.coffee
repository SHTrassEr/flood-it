class FloodIt.Engine
  constructor: (@game) ->

  step: (selectedValue) ->
    FloodIt.core.flood(
      @game.playGround,
      @game.players[@game.currentPlayerId].startPoint,
      selectedValue
    );
    @switchPlayer();

  switchPlayer: () ->
    if (@game.currentPlayerId < @game.playersCount - 1)
      @game.currentPlayerId++
    else
      @game.currentPlayerId = 0;
