require 'spec_helper'

module Clearsale
  describe '.configuration' do
    it 'yields a Clearsale::Configuration instance' do
      Clearsale.configuration do |config|
        expect(config).to be_kind_of Clearsale::Configuration
      end
    end

    it 'returns the configuration when queried' do
      Clearsale.configuration do |config|
        expect(Clearsale.configuration.object_id).to eq config.object_id
      end
    end

    it 'may be explicitly overridden' do
      configuration = Clearsale::Configuration.new
      expect {
        Clearsale.configuration = configuration
      }.to change(Clearsale, :configuration).to(configuration)
    end

    it 'overrides the configuration api key' do
      expect {
        Clearsale.configure.api_key = 'test'
      }.to change(Clearsale.configure, :api_key).to('test')
    end

    it 'overrides the configuration client_id' do
      expect {
        Clearsale.configure.client_id = 'sellect'
      }.to change(Clearsale.configure, :client_id).to('sellect')
    end

    it 'overrides the configuration client_secret' do
      expect {
        Clearsale.configure.client_secret = 'sellect sellect'
      }.to change(Clearsale.configure, :client_secret).to('sellect sellect')
    end

    it 'overrides the configuration endpoint' do
      expect {
        Clearsale.configure.endpoint = 'https://sellect.com/api'
      }.to change(Clearsale.configure, :endpoint).to('https://sellect.com/api')
    end

    it 'overrides the configuration analysis_location' do
      expect {
        Clearsale.configure.analysis_location = 'BRA'
      }.to change(Clearsale.configure, :analysis_location).to('BRA')
    end
  end
end
