set :deploy_to, "/var/www/" + "domain"
set :branch, "master"
set :keep_releases, 5

server "domain", :app, :primary => true
