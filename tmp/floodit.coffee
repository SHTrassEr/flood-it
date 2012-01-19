root = exports ? this
root.FloodIt = {} if root.FloodIt == undefined;
FloodIt = root.FloodIt
class FloodIt.Point
  constructor: (@rowIndex, @columnIndex) ->
  left: -> new FloodIt.Point(@rowIndex, @columnIndex - 1)
  right: -> new FloodIt.Point(@rowIndex, @columnIndex + 1)
  up: -> new FloodIt.Point(@rowIndex - 1, @columnIndex)
  down: -> new FloodIt.Point(@rowIndex + 1, @columnIndex)
class FloodIt.PlayGround
  constructor: (@rowCount, @columnCount) ->
    @playGround = []
    for rowIndex in [0..@rowCount - 1]
      @playGround.push([ ])
      for columnIndex in [0..@columnCount - 1]
        @playGround[rowIndex].push(0);

  isPointInPlayGround: (pointToCell) ->
    if(not pointToCell instanceof FloodIt.Point)
      throw new Error("ArgumentException: pointToCell is not instance of FloodIt.Point");
    if pointToCell.columnIndex < 0 or pointToCell.columnIndex >= @columnCount
      return false;
    if pointToCell.rowIndex < 0 or pointToCell.rowIndex >= @rowCount
      return false;
    return true

  getCellValue: (pointToCell) ->
    if (@isPointInPlayGround(pointToCell) == true)
      @playGround[pointToCell.rowIndex][pointToCell.columnIndex];
    else
      throw new Error("ArgumentException: pointToCell");
      
   setCellValue: (pointToCell, value) ->
    if (@isPointInPlayGround(pointToCell) == true)
      @playGround[pointToCell.rowIndex][pointToCell.columnIndex] = value;
      value
    else
      throw new Error("ArgumentException: pointToCell")
class FloodIt.Player
  constructor: (@name, @startPoint) ->
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
class FloodIt.core
  floodFill = (playGround, currentPoint, targetValue, replacementValue) ->
    return if not playGround.isPointInPlayGround(currentPoint);
    return if playGround.getCellValue(currentPoint) != targetValue
    playGround.setCellValue(currentPoint, replacementValue);
    floodFill(playGround, currentPoint.left(), targetValue, replacementValue);
    floodFill(playGround, currentPoint.right(), targetValue, replacementValue);
    floodFill(playGround, currentPoint.up(), targetValue, replacementValue);
    floodFill(playGround, currentPoint.down(), targetValue, replacementValue);

  @flood: (playGround, startPoint, replacementValue) ->
    return if playGround.getCellValue(startPoint) == replacementValue;
    floodFill(playGround,
      startPoint,
      playGround.getCellValue(startPoint),
      replacementValue
    );
    playGround;
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
