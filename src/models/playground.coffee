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
