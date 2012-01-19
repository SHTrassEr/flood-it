class FloodIt.Cell
  constructor: (@rowIndex, @columnIndex) ->
  left: -> new FloodIt.Cell(@rowIndex, @columnIndex - 1)
  right: -> new FloodIt.Cell(@rowIndex, @columnIndex + 1)
  up: -> new FloodIt.Cell(@rowIndex - 1, @columnIndex)
  down: -> new FloodIt.Cell(@rowIndex + 1, @columnIndex)
