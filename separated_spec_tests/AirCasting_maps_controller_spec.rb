require 'spec_helper'

describe MapsController do
  describe "#show" do
    context "with valid map state" do
      before { ActiveSupport::JSON.should_receive(:decode).with("value").and_return(:result) }

      it "validates map state" 

    end

    context "with invalid map state" do
      before { ActiveSupport::JSON.should_receive(:decode).with("value").and_raise("some error") }

      it "should fail" 

    end
  end
end

