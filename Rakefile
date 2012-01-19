
begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end

task :compile do
  `cat src/global.coffee > tmp/floodit.coffee`
  `cat src/models/point.coffee >> tmp/floodit.coffee`
  `cat src/models/playground.coffee >> tmp/floodit.coffee`
  `cat src/models/player.coffee>> tmp/floodit.coffee`
  `cat src/models/game.coffee>> tmp/floodit.coffee`

  `cat src/controllers/core.coffee >> tmp/floodit.coffee`
  `cat src/controllers/map.coffee >> tmp/floodit.coffee`
  `cat src/controllers/engine.coffee >> tmp/floodit.coffee`

  `coffee -c -j "public/javascripts/floodit.js" "tmp/floodit.coffee"`
  
  `cat src/global.coffee > tmp/widget.coffee`
  `cat src/views/widget.coffee >> tmp/widget.coffee`
  `coffee -c -j "public/javascripts/widget.js" "tmp/widget.coffee"`
end
