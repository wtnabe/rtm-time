# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rtm_time/version'

Gem::Specification.new do |spec|
  spec.name          = "rtm-time"
  spec.version       = RtmTime::VERSION
  spec.authors       = ["wtnabe"]
  spec.email         = ["wtnabe@gmail.com"]

  spec.summary       = %q{parse and inspect RTM's estimate time}
  spec.description   = %q{parse and inspect RTM's estimate time}
  spec.homepage      = "https://github.com/wtnabe/rtm-time"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rr"
  if (Gem::Version.create(RUBY_VERSION) <=> Gem::Version.create('1.9')) >= 0
    spec.add_development_dependency "simplecov"
  else
    spec.add_development_dependency "rcov"
  end
end
