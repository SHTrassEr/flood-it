beforeEach(function() {
  this.addMatchers({
    toBePlaying: function(expectedSong) {
      var player = this.actual;
      return player.currentlyPlayingSong === expectedSong && 
             player.isPlaying;
    }
  });
});

function fillPlayGroundByOrder(playGround) {
  fillPlayGround(
    playGround, 
    function(row, column) {
      return row * playGround.columnCount + column + 1;
    }
  );
}

function fillPlayGroundByValue(playGround, value) {
  fillPlayGround(
    playGround, 
    function(row, column) {
      return value;
    }
  );
}

function fillPlayGround(playGround, fillMethod) {
  var row;
  var column;
  for (row = 0; row < playGround.rowCount; row++) {
    for (column = 0; column < playGround.columnCount; column++) {
      playGround.setCellValue(
        new FloodIt.Cell(row, column),
        fillMethod(row, column)
      );
    }
  }
}
