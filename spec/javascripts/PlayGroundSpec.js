describe("PlayGround", function() {
  var firstPlayGround;
  var secondPlayGround;
  beforeEach(function() {
    firstPlayGround = new FloodIt.PlayGround(2, 4);
    secondPlayGround = new FloodIt.PlayGround(6, 8);
  });
  
  it("should have a valid sizes", function() {
    expect(firstPlayGround.rowCount).toEqual(2);
    expect(firstPlayGround.columnCount).toEqual(4);
    expect(secondPlayGround.rowCount).toEqual(6);
    expect(secondPlayGround.columnCount).toEqual(8);
  })
  
  it("should be able to set value to the top left cell", function() {
    expect(firstPlayGround.setCellValue(new FloodIt.Point(0, 0), 1)).toEqual(1);
    expect(secondPlayGround.setCellValue(new FloodIt.Point(0, 0), 2)).toEqual(2);
  })
  it("should be able to set value to the top right cell", function() {
    expect(firstPlayGround.setCellValue(new FloodIt.Point(0, 3), 1)).toEqual(1);
    expect(secondPlayGround.setCellValue(new FloodIt.Point(0, 7), 2)).toEqual(2);
  })
  it("should be able to set value to the bottom left cell", function() {
    expect(firstPlayGround.setCellValue(new FloodIt.Point(1, 0), 1)).toEqual(1);
    expect(secondPlayGround.setCellValue(new FloodIt.Point(5, 0), 2)).toEqual(2);
  })
  it("should be able to set value to the bottom right cell", function() {
    expect(firstPlayGround.setCellValue(new FloodIt.Point(1, 3), 1)).toEqual(1);
    expect(secondPlayGround.setCellValue(new FloodIt.Point(5, 7), 2)).toEqual(2);
  })
  
  describe("when values has been added to the field", function() {
    beforeEach(function() {
      fillPlayGroundByOrder(firstPlayGround);
      fillPlayGroundByOrder(secondPlayGround);
    });
    
    it("should be able to get value of top left cell", function() {
      expect(firstPlayGround.getCellValue(new FloodIt.Point(0, 0))).toEqual(1);
      expect(secondPlayGround.getCellValue(new FloodIt.Point(0, 0))).toEqual(1);
    })
    it("should be able to get value of top right cell", function() {
      expect(firstPlayGround.getCellValue(new FloodIt.Point(0, 3))).toEqual(4);
      expect(secondPlayGround.getCellValue(new FloodIt.Point(0, 7))).toEqual(8);
    })
    it("should be able to get value of bottom left cell", function() {
      expect(firstPlayGround.getCellValue(new FloodIt.Point(1, 0))).toEqual(5);
      expect(secondPlayGround.getCellValue(new FloodIt.Point(5, 0))).toEqual(41);
    })
    it("should be able to get value of bottom right cell", function() {
      expect(firstPlayGround.getCellValue(new FloodIt.Point(1, 3))).toEqual(8);
      expect(secondPlayGround.getCellValue(new FloodIt.Point(5, 7))).toEqual(48);
    })
  })
  
});
