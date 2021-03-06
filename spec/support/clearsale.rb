# encoding: UTF-8
require 'pathname'

path = Pathname.new(File.expand_path('../../clearsale.yml', __FILE__))

if path.exist?
  begin
    CLEARSALE_CONFIGURATION = YAML.load_file(path)

    Clearsale.configure do |config|
      config.api_key           = CLEARSALE_CONFIGURATION['api_key']           || abort("Clearsale congiguration file '#{path}' is missing the 5C3E91A7-D450-4977-A377-894C92A877C3")
      config.client_id         = CLEARSALE_CONFIGURATION['client_id']         || abort("Clearsale congiguration file '#{path}' is missing the client id")
      config.client_secret     = CLEARSALE_CONFIGURATION['client_secret']     || abort("Clearsale congiguration file '#{path}' is missing the client_secret")
      config.test_mode         = CLEARSALE_CONFIGURATION['test_mode']         || abort("Clearsale congiguration file '#{path}' is missing the test_mode")
      config.analysis_location = CLEARSALE_CONFIGURATION['analysis_location'] || abort("Clearsale congiguration file '#{path}' is missing the analysis_location")
    end
  rescue NoMethodError
    abort "Clearsale congiguration file '#{path}' is malformatted or unreadable"
  end
else
  abort "Clearsale congiguration file '#{path}' not found"
end
