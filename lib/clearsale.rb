require 'clearsale/analysis'
require 'clearsale/configuration'
require 'clearsale/parser'
require 'clearsale/authentication'
require 'clearsale/config'
require 'clearsale/connector'
require 'clearsale/logger_formatter_filter'
require 'clearsale/object'
require 'clearsale/order'
require 'clearsale/order_response'

module Clearsale
  def self.configuration
    @@_configuration ||= Clearsale::Configuration.new
    yield @@_configuration if block_given?

     @@_configuration
  end

  def self.configuration=(configuration)
    raise ArrgumentError, 'Expect a Clearsale::Configuration instance' unless configuration.kind_of?(Configuration)
    @@_configuration = configuration
  end

  def self.configure(&block)
    configuration(&block)
  end

  def self.api_key
    configuration.api_key = api_key
  end

  def self.client_id
    configuration.client_id = client_id
  end

  def self.client_secret
    configuration.client_secret = client_secret
  end

  def self.endpoint
    configuration.endpoint = endpoint
  end

  def self.analysis_location
    configuration.analysis_location = analysis_location
  end

end
