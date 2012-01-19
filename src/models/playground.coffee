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
