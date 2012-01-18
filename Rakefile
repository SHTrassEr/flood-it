
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
  
  `cat src/global.coffee > tmp/floodit_view.coffee`
  `cat src/views/playgroundview.coffee >> tmp/floodit_view.coffee`
  `coffee -c -j "public/javascripts/floodit_view.js" "tmp/floodit_view.coffee"`
end
