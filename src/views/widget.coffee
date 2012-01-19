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


