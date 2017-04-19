require 'rubygems'
require 'multi_json'
require 'json'

module Clearsale
  class Authentication
    def self.connector
      @connector = Connector.new('auth/login')
    end

    def self.request_auth
      begin
        body = { "Login" => auth_params }
        response = connector.do_request(body)

        case response
        when Net::HTTPOK
          decoded_json = Parser.decode_json(response.read_body)

          token = decoded_json.fetch('Token')
          Clearsale.configure.token  = token['Value']
          return Object.new(token)
        when Net::HTTPClientError,  Net::HTTPInternalServerError
          raise response.message
        end
      rescue Timeout::Error => error
        response.mesage
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

    def self.parse_response(response)
      JSON.parse(response)
    end

    def self.clear_connector
      @connector = nil
    end
  end
end
