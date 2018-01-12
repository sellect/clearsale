require 'multi_json'
module Clearsale
  class Parser
    def self.decode_json(body)
      if body.to_s =~ /^(?:[\d]+|null|true|false)$/
        MultiJson.decode("[#{body}]").first
      else
        MultiJson.decode body
      end
    end
  end
end
