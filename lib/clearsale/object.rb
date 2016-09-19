require 'json'
require 'ostruct'

module Clearsale
  class Object < OpenStruct
    def parse(hash)
      json = hash.to_json
      JSON.parse(json, object_class: OpenStruct)
    end
  end
end
