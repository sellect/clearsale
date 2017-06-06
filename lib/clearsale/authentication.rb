require 'rubygems'
require 'multi_json'
require 'json'

module Clearsale
  class Authentication
    attr_accessor :token
    def self.connector
      @connector = Connector.new('auth/login')
    end

    def self.request_auth
      body = { "Login" => auth_params }
      response = connector.do_request(body)

      case response
      when Net::HTTPOK
        decoded_json = Parser.decode_json(response.read_body)

        @token = decoded_json.fetch('Token')
        Clearsale.configure.token  = token['Value']
        Object.new(token)
      when Net::HTTPClientError,  Net::HTTPInternalServerError
        raise response.message
      end
    end

    private
    def self.auth_params
      {
        "ApiKey"       => Clearsale.configure.api_key,
        "ClientID"     => Clearsale.configure.client_id,
        "ClientSecret" => Clearsale.configure.client_secret
      }
    end
  end
end
