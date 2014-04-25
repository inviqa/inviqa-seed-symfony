# Overwrite hobo README with project README
old_readme = File.join(Hobo.project_config.project_path, 'README.md')
new_readme = File.join(Hobo.project_config.project_path, 'README.project.md')
FileUtils.mv new_readme, old_readme
