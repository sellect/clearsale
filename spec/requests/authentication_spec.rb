require 'spec_helper'
require 'clearsale'
require 'webmock/rspec'
module Clearsale
  describe 'request authentication token', :vcr do
    it '.request_auth' do
      expect(Clearsale::Authentication.request_auth).to be_kind_of(Clearsale::Object)
    end

    it 'token should set in configuration' do
      expect(Clearsale.configuration.token).to eq 'L5TJIQX4'
    end
  end
end
