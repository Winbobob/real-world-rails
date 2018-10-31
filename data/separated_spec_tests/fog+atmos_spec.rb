require "spec_helper"
require "fog/bin"
require "helpers/bin"

describe Atmos do
  include Fog::BinSpec

  let(:subject) { Atmos }

  describe "#services" do
    it "includes all services" 

  end

  describe "#class_for" do
    describe "when requesting storage service" do
      it "returns correct class" 

    end
  end
end

