require_relative 'helper'

describe Pry::Ring do
  let(:ring) { described_class.new(3) }

  describe "#<<" do
    it "adds elements as is when the ring is not full" 


    it "overwrites elements when the ring is full" 

  end

  describe "#[]" do
    context "when the ring is empty" do
      it "returns nil" 

    end

    context "when the ring is not full" do
      before { ring << 1 << 2 << 3 }

      it "reads elements" 


      it "reads elements via range" 

    end

    context "when the ring is full" do
      before { ring << 1 << 2 << 3 << 4 << 5 }

      it "reads elements" 


      it "reads elements via inclusive range" 


      it "reads elements via exclusive range" 

    end
  end

  describe "#to_a" do
    it "returns a duplicate of internal buffer" 

  end

  describe "#clear" do
    it "resets ring to initial state" 

  end
end

