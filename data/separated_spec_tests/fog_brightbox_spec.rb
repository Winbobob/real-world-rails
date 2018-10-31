require "spec_helper"
require "fog/bin"
require "helpers/bin"

describe Brightbox do
  include Fog::BinSpec

  let(:subject) { Brightbox }

  describe "#services" do
    it "includes all services" 

  end

  describe "#class_for" do
    describe "when requesting compute service" do
      it "returns correct class" 

    end

    describe "when requesting storage service" do
      it "returns correct class" 

    end
  end
end

