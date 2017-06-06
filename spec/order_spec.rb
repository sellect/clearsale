# encoding: utf-8
require 'spec_helper'

module Clearsale
  describe 'Order' do
    before :each do
      Clearsale.configure.token = 'test token'
    end
    it '.build_orders_request_body for send order' do
      request_body = Clearsale::Order.build_orders_request_body(order)
      expect(request_body).to  be_kind_of(Hash)
      expect(request_body).to  have_key('LoginToken')
      expect(request_body['Orders']).to  be_kind_of(Array)
      expect(request_body).to  eq(expected_request_body_for_send_order)
    end

    it '.build_orders_request_body for get order status' do
      request_body = Clearsale::Order.build_orders_request_body('TEST702520223')
      expect(request_body).to  be_kind_of(Hash)
      expect(request_body).to  have_key('LoginToken')
      expect(request_body['Orders']).to  be_kind_of(Array)
      expect(request_body).to  eq(expected_request_body_for_get_order_status)
    end

  end
end
