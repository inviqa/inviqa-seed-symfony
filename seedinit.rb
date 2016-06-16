Hem.require_version '>= 1.1.0'

# Overwrite hem README with project README
old_readme = 'README.md'
new_readme = 'README.project.md.erb'
File.delete old_readme
FileUtils.mv new_readme, "#{old_readme}.erb"

# Project local VM SSL certificate
Hem.project_config.tmp.chef_ssl = Hem::Lib::SelfSignedCertGenerator.generate(Hem.project_config.hostname)

# MySQL local VM MySQL passwords
password = '984C42CF342f7j6' # password still is set in the basebox
Hem.project_config.tmp.mysql_root_password = password
Hem.project_config.tmp.mysql_repl_password = password
Hem.project_config.tmp.mysql_debian_password = password
