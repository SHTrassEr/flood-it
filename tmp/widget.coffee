root = exports ? this
root.FloodIt = {} if root.FloodIt == undefined;
FloodIt = root.FloodIt
class FloodIt.Widget
  constructor: (@canvas, @game) ->
    @context = canvas.getContext('2d');
    @context.fillStyle = '#000';
    @context.fillRect(
      0, 
      0, 
      canvas.width,
      canvas.height
    );
    @borderWidth = 10;
   
    @playGroundRect = 
      top: @borderWidth
      left: @borderWidth
      width: @canvas.width - @borderWidth * 2
      height: @canvas.height - @borderWidth * 2
      
    @playGroundWidget = new FloodIt.PlayGroundWidget(
      @context,
      @game.playGround,
      @playGroundRect
    );
    
    @engine = FloodIt.Engine;
    widget = this;
    @canvas.addEventListener(
      "click", 
      (e) ->  widget.click(e),
      false);
    @refresh();
      
  refresh: () ->
    for player in @game.players
      playerRect = @playGroundWidget.getCellRect(
        player.startCell.rowIndex,
        player.startCell.columnIndex,
      );
      if (player == @game.players[@game.currentPlayerId])
        @context.fillStyle = @playGroundWidget.colorsArray[player.currentValue];
      else 
        @context.fillStyle = '#000';
      @context.fillRect(
        playerRect.left - @borderWidth + 1,
        playerRect.top - @borderWidth + 1,
        playerRect.width + 3 * @borderWidth - 2,
        playerRect.height + 3 * @borderWidth - 2,
      );
    
    
    @playGroundWidget.refresh();
    
    
  click: (e) ->
    cursorPosition = @getCursorPosition(e);
    selectedCell = @playGroundWidget.getCellByCursorPosition(cursorPosition);
    @engine.step(@game, @game.playGround.getCellValue(selectedCell));
    @refresh();
    
  getCursorPosition: (e) ->
    cursorPosition = 
      x: 0
      y: 0
    if e.pageX or e.pageY
      cursorPosition.x = e.pageX;
      cursorPosition.y = e.pageY;
    else 
      cursorPosition.x = e.clientX + document.body.scrollLeft +
           document.documentElement.scrollLeft;
      cursorPosition.y = e.clientY + document.body.scrollTop +
           document.documentElement.scrollTop;
    cursorPosition.x -= @canvas.offsetLeft;
    cursorPosition.y -= @canvas.offsetTop;
    cursorPosition


class FloodIt.PlayGroundWidget
  constructor: (@context, @playGround, @rect) ->
    @colorsArray = [
      "#5151f5", "#54fc54", "#57ffff", 
      "#fa5252", "#f550f5", "#fcf951",
      "#fcfcfc"];
    
  refresh: () ->
    @context.fillStyle = '#00f';
    cnt = 0;
    for rowIndex in [0..@playGround.rowCount - 1]
      for columnIndex in [0..@playGround.columnCount - 1]
        groundValue = @playGround.getCellValue(new FloodIt.Cell(rowIndex, columnIndex));
        @drawCell(
          @context,
          @getCellRect(rowIndex, columnIndex),
          groundValue
        );
        
  getCellRect: (rowIndex, columnIndex) ->
    cellRect = 
      left: Math.floor(@rect.width / @playGround.columnCount * columnIndex + @rect.left)
      top: Math.floor(@rect.height / @playGround.rowCount * rowIndex + @rect.top)
      width: Math.ceil(@rect.width / @playGround.columnCount)
      height:Math.ceil(@rect.height / @playGround.rowCount)
  
  getCellByCursorPosition: (cursorPosition) ->
    cellWidth = @rect.width / @playGround.columnCount;
    cellHeight = @rect.height / @playGround.rowCount;
    selectedCell = new FloodIt.Cell(
      Math.floor((cursorPosition.y - @rect.top) / cellHeight),
      Math.floor((cursorPosition.x - @rect.left) / cellWidth)
    );
    selectedCell;
    
  drawCell: (@context, cellRect, groundValue) ->
    cellCenter = 
      x: cellRect.left + cellRect.width / 2
      y: cellRect.top + cellRect.height / 2

    @context.fillStyle = '#f00';
    @context.fillStyle = @colorsArray[groundValue] if @colorsArray[groundValue] != undefined;
    @context.fillRect(cellRect.left, cellRect.top, cellRect.width, cellRect.height);
    
    @context.fillStyle = "rgba(0,0,0,0.2)";  
#    @context.fillStyle = "#444444"; 
    @context.fillRect(
      cellCenter.x - cellRect.width / 6, 
      cellCenter.y - cellRect.height / 6,
      cellRect.width / 3, 
      cellRect.height / 3);

    @context.fillRect(
      cellCenter.x - cellRect.width / 12, 
      cellCenter.y - cellRect.height / 12,
      cellRect.width / 6, 
      cellRect.height / 6);

