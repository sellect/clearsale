module Clearsale
  class Config
    attr_accessor :logger, :log, :read_timeout, :open_timeout

    def self.logger
      @@logger ||= Logger.new(STDOUT)
    end

    def self.log
      @@log.nil? ? true : @@log
    end
  end
end
