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
