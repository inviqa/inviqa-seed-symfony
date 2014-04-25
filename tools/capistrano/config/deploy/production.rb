set :deploy_to, "/var/www/" + "domain"
set :branch, "master"
set :keep_releases, 5

server "user@domain", :app, :primary => true
# set :gateway, "user@host" # Use if you need to bounce through another server