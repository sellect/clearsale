module Clearsale
  class OrderResponse
    STATUS_MAP = {
      "APA" => :automatic_approval,
      "APM" => :manual_approval,
      "RPM" => :rejected_without_suspicion,
      "AMA" => :manual_analysis,
      "ERR" => :error,
      "NVO" => :waiting,
      "SUS" => :manual_rejection,
      "CAN" => :cancelled,
      "FRD" => :fraud,
    }

    attr_reader :order_id, :status, :score

    def self.build_from_send_order(package, order)
      order_number = case order
      when String
        order
      when Array
        order.first.present? ? order.first['ID'] : ''
      when Hash
        order['ID']
      end
      query    = {'ID' => order_number, 'Status' => 'ERR', 'Score' => 0.0 }
      packages = package.fetch('Orders', [query])
      response = packages.first

      new(response)
    end

    def initialize(response)
      @order_id = response['ID']
      @score    = response['Score'].to_f
      @status   = STATUS_MAP[response['Status']]
    end

    def approved?
      @status == :automatic_approval || @status == :manual_approval
    end

    def rejected?
      @status == :rejected_without_suspicion || @status == :manual_rejection || @status == :cancelled
    end

    def fraud?
      @status == :fraud
    end

    def manual_analysis?
      @status == :manual_analysis
    end

    def inexistent_order?
      @status == :inexistent_order
    end

    def waiting?
      @status == :waiting
    end
  end
end
