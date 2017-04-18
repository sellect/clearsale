module Clearsale
  class Analysis
    def self.connector
      @connector = Clearsale::Connector.new('order/send')
    end

    def self.send_order(order)
      Clearsale::Authentication.request_auth

      request_body = Clearsale::Order.build_orders_request_body(order)
      response     = connector.do_request(request_body)
      OrderResponse.build_from_send_order(Clearsale::Parser.decode_json(response.read_body))
    end


    def self.clear_connector
      @connector = nil
    end


    def self.get_order_status(order_id)
      request = {'orderID' => order_id}
      OrderResponse.build_from_update(connector.do_request('GetOrderStatus', request))
    end
  end
end
