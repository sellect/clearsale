require 'byebug'
module Clearsale
  class Analysis

    def self.send_order(order)
      send_request(order, :send)
    end

    def self.get_order_status(order)
      send_request(order, :get)
    end

    def self.send_request(order, action)
      Clearsale::Authentication.request_auth
      connector       = Clearsale::Connector.new("order/#{action}")
      clearsale_order = Clearsale::Order.new(order)
      request_body    = clearsale_order.request_body
      
      response        = connector.do_request(request_body)
      OrderResponse.build_from_send_order(Clearsale::Parser.decode_json(response.read_body))
    end
  end
end
