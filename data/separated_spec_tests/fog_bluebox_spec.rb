require "spec_helper"
require "fog/bin"
require "helpers/bin"

describe Bluebox do
  include Fog::BinSpec

  let(:subject) { Bluebox }

  describe "#services" do
    it "includes all services" 

  end

  describe "#class_for" do
    describe "when requesting compute service" do
      it "returns correct class" 

    end

    describe "when requesting dns service" do
      it "returns correct class" 

    end

    describe "when requesting blb service" do
      it "returns correct class" 

    end
  end

  describe "#[]" do
    describe "when requesting compute service" do
      it "returns instance" 

    end

    describe "when requesting dns service" do
      it "returns instance" 

    end
  end
end

