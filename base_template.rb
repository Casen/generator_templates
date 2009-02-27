run "echo TODO > README"

generate :nifty_layout

gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com'
rake "gems:install"


git :init

file ".gitignore", <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"

git :add => ".", :commit => "-m 'initial commit'"

if yes?("Do you want user authentication?")
  generate :nifty_authentication
  git :add => ".", :commit => "-m 'adding authentication'"
end


