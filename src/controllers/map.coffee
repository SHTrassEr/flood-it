class FloodIt.Map

  fillPlayGround = (game) ->
    for rowIndex in [0..game.playGround.rowCount - 1]
      for columnIndex in [0..game.playGround.columnCount - 1]
        game.playGround.setCellValue(
          new FloodIt.Cell(rowIndex, columnIndex),
          Math.floor(Math.random() * game.colorsCount)
        );

  initPlayers = (game) ->
    game.players[0].startCell = new FloodIt.Cell(0, 0);
    game.players[1].startCell = 
      new FloodIt.Cell(game.playGround.rowCount - 1, game.playGround.columnCount - 1);

    game.players[0].currentValue = 
      game.playGround.getCellValue(game.players[0].startCell);
    game.players[1].currentValue = 
      game.playGround.getCellValue(game.players[1].startCell);

  @init: (game) ->
    fillPlayGround(game);
    initPlayers(game);
