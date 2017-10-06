Hem.require_version '>= 1.2.0'

# Overwrite .dev hostnames with .test
config.hostname = "#{config.name}.test"

# Overwrite hem README with project README
old_readme = 'README.md'
new_readme = 'README.project.md.erb'
File.delete old_readme
FileUtils.mv new_readme, "#{old_readme}.erb"

# MySQL local VM MySQL passwords
password = '984C42CF342f7j6' # password still is set in the basebox
config.tmp.mysql_root_password = password
config.tmp.mysql_repl_password = password
config.tmp.mysql_debian_password = password

config.locate.Berksfile.patterns = ['tools/chef/Berksfile']
config.locate.Cheffile.patterns = ['tools/chef/Cheffile']
config.locate.Gemfile.patterns = ['Gemfile']
config.locate.Vagrantfile.patterns = ['tools/vagrant/Vagrantfile']


symfony_git_url = "git@github.com:symfony/symfony-standard"

symfony_seed = Hem::Lib::Seed::Seed.new(
  File.join(Hem.seed_cache_path, "symfony-standard"),
  symfony_git_url
)
symfony_seed.update

tags = []
Dir.chdir File.join(Hem.seed_cache_path, "symfony-standard") do
  tags = `git tag`.split("\n")
end

versions = tags.map { |tag| {tag: tag, version: Gem::Version.new(tag.sub(/^v/,''))} }

symfony_seed.export File.join(config.project_path, 'symfony-standard'),
    :name => "symfony-standard",
    :ref => versions.sort { |x, y| x[:version] <=> y[:version] }.last[:tag]

FileUtils.mv Dir.glob('symfony-standard/*').select {|f| File.directory? f}, config.project_path
File.open('.gitignore', 'a') do |gitignore|
  gitignore << File.read('symfony-standard/.gitignore');
end
FileUtils.rm_r 'symfony-standard'

FileUtils.mv 'seed/parameters.yml.dist.erb', 'app/config/'
FileUtils.rm 'app/config/parameters.yml.dist'
FileUtils.rmdir 'seed'
File.symlink '../bin/console', 'app/console' unless File.exist?('app/console')
