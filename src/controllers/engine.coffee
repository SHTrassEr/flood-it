class FloodIt.Engine
  @step: (game, selectedValue) ->
    return if not FloodIt.Engine.isValidSelectedValue(game, selectedValue);
    FloodIt.Core.flood(
      game.playGround,
      game.players[game.currentPlayerId].startCell,
      selectedValue
    );
    FloodIt.Engine.updatePlayersColor(game);
    FloodIt.Engine.switchPlayer(game);

  @switchPlayer: (game) ->
    if (game.currentPlayerId < game.playersCount - 1)
      game.currentPlayerId++
    else
      game.currentPlayerId = 0;
      
  @updatePlayersColor: (game) ->
    game.players.forEach((player, i) ->
      player.currentValue = 
        game.playGround.getCellValue(player.startCell);
    );

  @isValidSelectedValue: (game, selectedValue) ->
    for player in game.players
      return false if selectedValue == player.currentValue
    true;
