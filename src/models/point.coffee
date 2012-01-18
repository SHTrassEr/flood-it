class FloodIt.Point
  constructor: (@rowIndex, @columnIndex) ->
  left: -> new FloodIt.Point(@rowIndex, @columnIndex - 1)
  right: -> new FloodIt.Point(@rowIndex, @columnIndex + 1)
  up: -> new FloodIt.Point(@rowIndex - 1, @columnIndex)
  down: -> new FloodIt.Point(@rowIndex + 1, @columnIndex)
