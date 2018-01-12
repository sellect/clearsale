# encoding: utf-8
require 'spec_helper'

module Clearsale
  describe 'Order' do
    before :each do
      Clearsale.configure.token = 'test token'
    end
    it '.request_body for send order' do
      clearsale_order = Clearsale::Order.new(order)
      request_body    = clearsale_order.request_body
      expect(request_body).to  be_kind_of(Hash)
      expect(request_body).to  have_key('LoginToken')
      expect(request_body['Orders']).to  be_kind_of(Array)
      expect(request_body).to  eq(expected_request_body_for_send_order)
    end

    it '.request_body for get order status' do
      clearsale_order = Clearsale::Order.new('TEST702520224')
      request_body    = clearsale_order.request_body
      expect(request_body).to  be_kind_of(Hash)
      expect(request_body).to  have_key('LoginToken')
      expect(request_body['Orders']).to  be_kind_of(Array)
      expect(request_body).to  eq(expected_request_body_for_get_order_status)
    end

  end
end
