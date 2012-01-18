describe("Core", function() {
    
    it("should be able to fill the full play ground", function() {
      playGround = new FloodIt.PlayGround(5, 8);
      var filledPlayGround = new FloodIt.PlayGround(5, 8);
      fillPlayGroundByValue(filledPlayGround, 1);
      FloodIt.core.flood(playGround, new FloodIt.Point(0,0), 1);
      expect(playGround).toEqual(filledPlayGround);
    })

    it("should be able to fill the one field of play ground", function() {
      playGround = new FloodIt.PlayGround(3, 9);
      fillPlayGroundByOrder(playGround);
      var filledPlayGround = new FloodIt.PlayGround(3, 9);
      fillPlayGroundByOrder(filledPlayGround);
      FloodIt.core.flood(playGround, new FloodIt.Point(0,0), 1);
      expect(playGround).toEqual(filledPlayGround);
    })
    
    it("should be able to fill play ground cell by cell", function() {
      playGround = new FloodIt.PlayGround(3, 9);
      fillPlayGroundByOrder(playGround);
      var filledPlayGround = new FloodIt.PlayGround(3, 9);
      fillPlayGroundByValue(filledPlayGround, 27);
      for (i = 2; i < 28; i++) {
        FloodIt.core.flood(playGround, new FloodIt.Point(0,0), i);
      }
      expect(playGround).toEqual(filledPlayGround);
    })
    
});
