class FloodIt.Widget
  constructor: (@canvas, @game) ->
    @context = canvas.getContext('2d');
    @colorsArray = ["#e61961", "#4219e6", "#19e6b9", "#4ce619", "#fffb00"];
    @engine = FloodIt.Engine;
    widget = this;
    @canvas.addEventListener(
      "click", 
      (e) ->  widget.click(e),
      false);
    @refreshPlayGround();
    
  refreshPlayGround: () ->
    playGround = @game.playGround;
    @context.fillStyle = '#00f';
    cnt = 0;
    for rowIndex in [0..playGround.rowCount - 1]
      for columnIndex in [0..playGround.columnCount - 1]
        groundValue = playGround.getCellValue(new FloodIt.Point(rowIndex, columnIndex));
        @context.fillStyle = '#f00';
        @context.fillStyle = @colorsArray[groundValue] if @colorsArray[groundValue] != undefined;

        @context.fillRect(
          @canvas.width / playGround.columnCount * columnIndex, 
          @canvas.height / playGround.rowCount * rowIndex, 
          @canvas.width / playGround.columnCount * (columnIndex + 1), 
          @canvas.height / playGround.rowCount * (rowIndex + 1)
        );

  click: (e) ->
    cursorPosition = @getCursorPosition(e);
    cellWidth = @canvas.width / @game.playGround.columnCount;
    cellHeight = @canvas.height / @game.playGround.rowCount;
    selectedCell = new FloodIt.Point(
      Math.floor(cursorPosition.y / cellHeight),
      Math.floor(cursorPosition.x / cellWidth)
    );
    
    @engine.step(@game, @game.playGround.getCellValue(selectedCell));
    @refreshPlayGround();
    
  getValueByColor: (color) ->
    for colorIndex in [0..@colorsArray.length - 1]
      return colorIndex if @colorsArray[colorIndex] == color;
    
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


