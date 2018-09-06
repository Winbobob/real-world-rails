require "spec_helper"

describe Fog::Identity do
  Fog::Identity.providers.each do |provider|
    describe "when #{provider} is passed with no available credentials" do
      it "returns ArgumentError" 

    end
  end
end

