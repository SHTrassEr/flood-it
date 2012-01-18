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
    var row;
    var column;
    var counter = 1;
    for (row = 0; row < playGround.rowCount; row++) {
      for (column = 0; column < playGround.columnCount; column++) {
        playGround.setCellValue(
          new FloodIt.Point(row, column),
          counter
        );
        counter ++;
      }
    }
  }
