set :deploy_to, "/var/www/" + "int_domain"
set :branch, "develop"
set :keep_releases, 5

server "int_domain", :app, :primary => true
