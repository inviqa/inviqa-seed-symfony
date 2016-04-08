
Hem.require_version '>= 1.1.0'

# Overwrite hem README with project README
old_readme = File.join(Hem.project_config.project_path, 'README.md')
new_readme = File.join(Hem.project_config.project_path, 'README.project.md')
FileUtils.mv new_readme, old_readme
