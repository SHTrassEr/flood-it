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
