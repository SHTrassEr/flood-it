class FloodIt.PlayGroundWidget
  constructor: (@canvas, @game) ->
    @colorsArray = ["#e61961", "#4219e6", "#19e6b9", "#4ce619", "#fffb00"];
    
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
