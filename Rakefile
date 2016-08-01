require "bundler/gem_tasks"
task :default => :spec

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

if (Gem::Version.create(RUBY_VERSION) <=> Gem::Version.create('1.9')) < 0
  RSpec::Core::RakeTask.new(:rcov) do |spec|
    spec.pattern = 'spec/**/*_spec.rb'
    spec.rcov = true
  end
end

require 'rdoc/task'
RDoc::Task.new do |rdoc|
  version = defined?(RtmTime::VERSION) ? RtmTime::VERSION : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rtm-time #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

load File.dirname(__FILE__) + '/tasks/git.rake'
