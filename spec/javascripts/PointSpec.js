describe("Point", function() {
  beforeEach(function() {
    firstPoint = new FloodIt.Point(10, 20);
    secondPoint = new FloodIt.Point(30, 40);
  });

  it("should have a valid coordinates", function() {
    expect(firstPoint.x).toEqual(10);
    expect(firstPoint.y).toEqual(20);
    expect(secondPoint.x).toEqual(30);
    expect(secondPoint.y).toEqual(40);
  })

  it("should be possible to get left point", function() {
    expect(firstPoint.left()).toEqual(new FloodIt.Point(9, 20));
    expect(secondPoint.left()).toEqual(new FloodIt.Point(29, 40));
  })

  it("should be possible to get right point", function() {
    expect(firstPoint.right()).toEqual(new FloodIt.Point(11, 20));
    expect(secondPoint.right()).toEqual(new FloodIt.Point(31, 40));
  })

  it("should be possible to get up point", function() {
    expect(firstPoint.up()).toEqual(new FloodIt.Point(10, 19));
    expect(secondPoint.up()).toEqual(new FloodIt.Point(30, 39));
  })

  it("should be possible to get down point", function() {
    expect(firstPoint.down()).toEqual(new FloodIt.Point(10, 21));
    expect(secondPoint.down()).toEqual(new FloodIt.Point(30, 41));
  })


});
