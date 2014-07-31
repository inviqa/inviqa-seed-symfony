if ::Semantic::Version.new(Hobo::VERSION) < ::Semantic::Version.new('0.0.13')
  FileUtils.rm_rf Hobo.project_config.project_path
  raise Hobo::UserError.new "This seed requires at least hobo 0.0.13\n\nPlease upgrade with `gem install hobo-inviqa`"
end

# Overwrite hobo README with project README
old_readme = File.join(Hobo.project_config.project_path, 'README.md')
new_readme = File.join(Hobo.project_config.project_path, 'README.project.md')
FileUtils.mv new_readme, old_readme
