root = exports ? this
root.FloodIt = {} if root.FloodIt == undefined;
FloodIt = root.FloodIt
class FloodIt.Cell
  constructor: (@rowIndex, @columnIndex) ->
  left: -> new FloodIt.Cell(@rowIndex, @columnIndex - 1)
  right: -> new FloodIt.Cell(@rowIndex, @columnIndex + 1)
  up: -> new FloodIt.Cell(@rowIndex - 1, @columnIndex)
  down: -> new FloodIt.Cell(@rowIndex + 1, @columnIndex)
class FloodIt.PlayGround
  constructor: (@rowCount, @columnCount) ->
    @playGround = []
    for rowIndex in [0..@rowCount - 1]
      @playGround.push([ ])
      for columnIndex in [0..@columnCount - 1]
        @playGround[rowIndex].push(0);

  isCellInPlayGround: (cell) ->
    if(not cell instanceof FloodIt.Cell)
      throw new Error("ArgumentException: cell is not instance of FloodIt.Cell");
    if cell.columnIndex < 0 or cell.columnIndex >= @columnCount
      return false;
    if cell.rowIndex < 0 or cell.rowIndex >= @rowCount
      return false;
    return true

  getCellValue: (cell) ->
    if (@isCellInPlayGround(cell) == true)
      @playGround[cell.rowIndex][cell.columnIndex];
    else
      throw new Error("ArgumentException: cell");
      
   setCellValue: (cell, value) ->
    if (@isCellInPlayGround(cell) == true)
      @playGround[cell.rowIndex][cell.columnIndex] = value;
      value
    else
      throw new Error("ArgumentException: cell")
      
  loadPlayGroundFromArray: (valuesArray) ->
    if (valuesArray.length != @rowCount * @columnCount)
      throw new Error("ArgumentException: valuesArray")
    for rowIndex in [0..@rowCount - 1]
      for columnIndex in [0..@columnCount - 1]
        @playGround[rowIndex][columnIndex] = 
          valuesArray[rowIndex * @columnCount + columnIndex];
class FloodIt.Player
  constructor: (@name, @startCell, @currentValue) ->
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
class FloodIt.Core
  floodFill = (playGround, currentCell, targetValue, replacementValue) ->
    return if not playGround.isCellInPlayGround(currentCell);
    return if playGround.getCellValue(currentCell) != targetValue
    playGround.setCellValue(currentCell, replacementValue);
    floodFill(playGround, currentCell.left(), targetValue, replacementValue);
    floodFill(playGround, currentCell.right(), targetValue, replacementValue);
    floodFill(playGround, currentCell.up(), targetValue, replacementValue);
    floodFill(playGround, currentCell.down(), targetValue, replacementValue);

  @flood: (playGround, startCell, replacementValue) ->
    return if playGround.getCellValue(startCell) == replacementValue;
    floodFill(playGround,
      startCell,
      playGround.getCellValue(startCell),
      replacementValue
    );
    playGround;
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
    
  @initFromArray: (game, valuesArray) ->
    game.playGround.loadPlayGroundFromArray(valuesArray);
    initPlayers(game);
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
