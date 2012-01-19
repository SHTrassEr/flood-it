describe("Cell", function() {
  beforeEach(function() {
    firstCell = new FloodIt.Cell(10, 20);
    secondCell = new FloodIt.Cell(30, 40);
  });

  it("should have a valid coordinates", function() {
    expect(firstCell.rowIndex).toEqual(10);
    expect(firstCell.columnIndex).toEqual(20);
    expect(secondCell.rowIndex).toEqual(30);
    expect(secondCell.columnIndex).toEqual(40);
  })

  it("should be possible to get left Cell", function() {
    expect(firstCell.left()).toEqual(new FloodIt.Cell(10, 19));
    expect(secondCell.left()).toEqual(new FloodIt.Cell(30, 39));
  })

  it("should be possible to get right Cell", function() {
    expect(firstCell.right()).toEqual(new FloodIt.Cell(10, 21));
    expect(secondCell.right()).toEqual(new FloodIt.Cell(30, 41));
  })

  it("should be possible to get up Cell", function() {
    expect(firstCell.up()).toEqual(new FloodIt.Cell(9, 20));
    expect(secondCell.up()).toEqual(new FloodIt.Cell(29, 40));
  })

  it("should be possible to get down Cell", function() {
    expect(firstCell.down()).toEqual(new FloodIt.Cell(11, 20));
    expect(secondCell.down()).toEqual(new FloodIt.Cell(31, 40));
  })


});
