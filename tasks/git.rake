# -*- mode: ruby -*-

namespace :git do
  desc 'list untracked files'
  task :untracked do
    sh "git ls-files -o -X #{File.dirname(__FILE__) + '/../.gitignore'}"
  end
end
