class FloodIt.Map

  fillPlayGround = (game) ->
    for rowIndex in [0..game.rowCount - 1]
      for columnIndex in [0..game.columnCount - 1]
        game.playGround.setCellValue(
          new FloodIt.Point(rowIndex, columnIndex),
          Math.floor(Math.random() * game.colorsCount)
        );

  initPlayers = (game) ->
    game.players[0].startPoint = new FloodIt.Point(0, 0);
    game.players[1].startPoint = 
      new FloodIt.Point(game.rowCount - 1, game.columnCount - 1);

  @init: (game) ->
    game.playGround = 
      new FloodIt.PlayGround(game.rowCount, game.columnCount);
    fillPlayGround(game);
    initPlayers(game);
