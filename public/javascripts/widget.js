// Generated by CoffeeScript 1.2.1-pre
(function() {
  var FloodIt, root;

  root = typeof exports !== "undefined" && exports !== null ? exports : this;

  if (root.FloodIt === void 0) root.FloodIt = {};

  FloodIt = root.FloodIt;

  FloodIt.Widget = (function() {

    Widget.name = 'Widget';

    function Widget(canvas, game) {
      var widget;
      this.canvas = canvas;
      this.game = game;
      this.context = canvas.getContext('2d');
      this.colorsArray = ["#e61961", "#4219e6", "#19e6b9", "#4ce619", "#fffb00"];
      this.engine = FloodIt.Engine;
      widget = this;
      this.canvas.addEventListener("click", function(e) {
        return widget.click(e);
      }, false);
      this.refreshPlayGround();
    }

    Widget.prototype.refreshPlayGround = function() {
      var cnt, columnIndex, groundValue, playGround, rowIndex, _i, _ref, _results;
      playGround = this.game.playGround;
      this.context.fillStyle = '#00f';
      cnt = 0;
      _results = [];
      for (rowIndex = _i = 0, _ref = playGround.rowCount - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; rowIndex = 0 <= _ref ? ++_i : --_i) {
        _results.push((function() {
          var _j, _ref2, _results2;
          _results2 = [];
          for (columnIndex = _j = 0, _ref2 = playGround.columnCount - 1; 0 <= _ref2 ? _j <= _ref2 : _j >= _ref2; columnIndex = 0 <= _ref2 ? ++_j : --_j) {
            groundValue = playGround.getCellValue(new FloodIt.Point(rowIndex, columnIndex));
            this.context.fillStyle = '#f00';
            if (this.colorsArray[groundValue] !== void 0) {
              this.context.fillStyle = this.colorsArray[groundValue];
            }
            _results2.push(this.context.fillRect(this.canvas.width / playGround.columnCount * columnIndex, this.canvas.height / playGround.rowCount * rowIndex, this.canvas.width / playGround.columnCount * (columnIndex + 1), this.canvas.height / playGround.rowCount * (rowIndex + 1)));
          }
          return _results2;
        }).call(this));
      }
      return _results;
    };

    Widget.prototype.click = function(e) {
      var cellHeight, cellWidth, cursorPosition, selectedCell;
      cursorPosition = this.getCursorPosition(e);
      cellWidth = this.canvas.width / this.game.playGround.columnCount;
      cellHeight = this.canvas.height / this.game.playGround.rowCount;
      selectedCell = new FloodIt.Point(Math.floor(cursorPosition.y / cellHeight), Math.floor(cursorPosition.x / cellWidth));
      this.engine.step(this.game, this.game.playGround.getCellValue(selectedCell));
      return this.refreshPlayGround();
    };

    Widget.prototype.getValueByColor = function(color) {
      var colorIndex, _i, _ref;
      for (colorIndex = _i = 0, _ref = this.colorsArray.length - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; colorIndex = 0 <= _ref ? ++_i : --_i) {
        if (this.colorsArray[colorIndex] === color) return colorIndex;
      }
    };

    Widget.prototype.getCursorPosition = function(e) {
      var cursorPosition;
      cursorPosition = {
        x: 0,
        y: 0
      };
      if (e.pageX || e.pageY) {
        cursorPosition.x = e.pageX;
        cursorPosition.y = e.pageY;
      } else {
        cursorPosition.x = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
        cursorPosition.y = e.clientY + document.body.scrollTop + document.documentElement.scrollTop;
      }
      cursorPosition.x -= this.canvas.offsetLeft;
      cursorPosition.y -= this.canvas.offsetTop;
      return cursorPosition;
    };

    return Widget;

  })();

}).call(this);