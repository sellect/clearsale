require 'json'

module Clearsale
  class Order
    attr_accessor :orders

    def initialize(orders)
      @orders = orders
    end

    def request_body
      {
        'Apikey'           => Clearsale.configuration.api_key,
        'LoginToken'       => Clearsale.configuration.token,
        'AnalysisLocation' => Clearsale.configuration.analysis_location,
        'Orders'           => orders.is_a?(Array) ? @orders : [@orders]
      }
    end
    
  end
end
