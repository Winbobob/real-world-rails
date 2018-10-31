require "spec_helper"

describe Fog::CDN do
  Fog::CDN.providers.each do |provider|
    describe "when #{provider} is passed with no available credentials" do
      it "returns ArgumentError" 

    end
  end
end

