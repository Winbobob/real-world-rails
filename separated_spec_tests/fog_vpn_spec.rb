require "spec_helper"

describe Fog::VPN do
  Fog::VPN.providers.each do |provider|
    describe "when #{provider} is passed with no available credentials" do
      it "returns ArgumentError" 

    end
  end
end

