
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
  `cat src/point.coffee >> tmp/floodit.coffee`
  `cat src/playground.coffee >> tmp/floodit.coffee`
  `cat src/core.coffee >> tmp/floodit.coffee`
  `coffee -c -j "public/javascripts/floodit.js" "tmp/floodit.coffee"`
end
