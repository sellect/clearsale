require 'spec_helper'

module Clearsale
  describe OrderResponse do
    describe "#approved?" do
      let(:response) { { "ID" => "TEST200107788", "Status" => "","Score" => "99.9900" } }

      %w(APA APM).each do |status|
        it "should return true if status return is: #{status}" do
          response['Status'] =  status
          expect(OrderResponse.new(response)).to be_approved
        end
      end
    end

    describe "#rejected?" do
      let(:response) { { "ID" => "TEST200107788", "Status" => "","Score" => "99.9900" } }

      %w(RPM SUS CAN).each do |status|
        it "should return true if status return is: #{status}" do
          response['Status'] =  status
          expect(OrderResponse.new(response)).to be_rejected
        end
      end
    end

    describe "#fraud?" do
      let(:response) { { "ID" => "TEST200107788", "Status" => "FRD","Score" => "99.9900" } }

      it "should return true if status return is FRD" do
        expect(OrderResponse.new(response)).to be_fraud
      end
    end
  end
end
