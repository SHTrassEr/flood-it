class FloodIt.Point
  constructor: (@x, @y) ->
  left: -> new FloodIt.Point(@x - 1, @y)
  right: -> new FloodIt.Point(@x + 1, @y)
  up: -> new FloodIt.Point(@x, @y - 1)
  down: -> new FloodIt.Point(@x, @y + 1)
