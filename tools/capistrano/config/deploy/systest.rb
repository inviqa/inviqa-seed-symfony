set :deploy_to, "/var/www/" + "systest_domain"
set :branch, "develop"
set :keep_releases, 5

server "systest_domain", :app, :primary => true
