# encoding: utf-8
require 'spec_helper'
require 'clearsale'
require 'webmock/rspec'

describe 'Risk Analysis with ClearSale' do

  describe 'sending orders', :vcr do
    it 'returns the response with status' do  
      response = Clearsale::Analysis.send_order(order)
      expect(response).to be_waiting
      expect(response.order_id).to eq('TEST702520223')
      expect(response.score).to be_between(0.0, 100.00)
    end
  end

  describe 'get order status', :vcr do
    it 'return the status of existing order' do
      response = Clearsale::Analysis.get_order_status('TEST702520223')
      expect(response).to be_manual_analysis
      expect(response.score).to be_between(0.0, 100.00)
    end
  end
end
