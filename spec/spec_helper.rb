require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, :development)
require 'vcr'

Dir["./spec/support/**/*.rb"].each {|f| require f}

VCR.configure do |c|
  c.cassette_library_dir     = File.expand_path('../../spec/fixtures/vcr_cassettes', __FILE__)
  c.hook_into :webmock
  #c.default_cassette_options = { :record => :none }
  #c.allow_http_connections_when_no_cassette = false
end

RSpec.configure do |config|
  config.mock_with :rspec
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
end
