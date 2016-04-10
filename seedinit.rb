
Hem.require_version '>= 1.1.0'

# Overwrite hem README with project README
old_readme = File.join(Hem.project_config.project_path, 'README.md')
new_readme = File.join(Hem.project_config.project_path, 'README.project.md.erb')
File.delete old_readme
FileUtils.mv new_readme, "#{old_readme}.erb"

Hem.project_config.tmp.chef_ssl = Hem::Lib::SelfSignedCertGenerator.generate(Hem.project_config.hostname)
