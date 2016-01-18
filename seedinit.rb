require 'semantic'

unless defined?(Hem) && ::Semantic::Version.new(Hem::VERSION).satisfies('1.0.1-beta6')
  FileUtils.rm_rf Hobo.project_config.project_path
  raise Hobo::UserError.new "This seed requires at least hem 1.0.1-beta6\n\nPlease upgrade at https://github.com/inviqa/hem"
end

# Overwrite hem README with project README
old_readme = File.join(Hem.project_config.project_path, 'README.md')
new_readme = File.join(Hem.project_config.project_path, 'README.project.md')
FileUtils.mv new_readme, old_readme
