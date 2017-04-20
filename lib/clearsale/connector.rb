require 'json'
require 'uri'
require 'net/http'

module Clearsale
  class Connector
    attr_accessor :method

    def initialize(method)
      @method  = method
    end

    def do_request(request_body)
      url  = URI("#{api_end_points}/#{method}")
      http             = Net::HTTP.new(url.host, url.port)
      http.use_ssl     = true
      http.verify_mode = ::OpenSSL::SSL::VERIFY_NONE
      request                 = Net::HTTP::Post.new(url)
      request["content-type"] = "text/json"
      request.body = request_body.to_json
      response = http.request(request)
    end

    private
    def api_end_points
      Clearsale.configure.endpoint
    end

  end
end


