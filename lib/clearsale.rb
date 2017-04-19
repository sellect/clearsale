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

end
