set :deploy_to, "/var/www/" + "uat_domain"
set :branch, "develop"
set :keep_releases, 5

server "uat_domain", :app, :primary => true
