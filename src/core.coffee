class FloodIt.core
  
  parse = (field, currentPoint) ->
    return if (currentPoint.x < 0);
    return if (currentPoint.x >= field.length);
    return if (currentPoint.y < 0);
    return if (currentPoint.y >= field.length);

  @Flood: (field, startPoint) ->
    field;

