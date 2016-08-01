$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'rtm-time'
if (Gem::Version.create(RUBY_VERSION) <=> Gem::Version.create('1.9')) >= 0
  require 'simplecov'
  SimpleCov.start do
    add_filter '/vendor/'
  end
end

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rr
end
