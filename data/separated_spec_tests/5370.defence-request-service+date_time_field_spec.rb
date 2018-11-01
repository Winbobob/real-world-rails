require "rails_helper"

RSpec.describe DateTimeField do

  context "from persisted value" do
    subject { DateTimeField.from_persisted_value datetime }

    context "persisted value is present" do
      let(:datetime) { DateTime.parse "13-04-1992 9:50" }

      it "has the same fields as the original" 

    end

    context "persisted value is nil" do
      let(:datetime) { nil }

      it "has no fields set" 

    end
  end

  context "from params" do
    subject { DateTimeField.new params }

    context "valid params" do
      let(:params) { { date: "13 Apr 1992", hour: "9", min: "50" } }

      it "is valid, with correct attributes" 

    end

    context "invalid params" do
      let(:params) { { date: "I", hour: "BROKEN", min: "!"}}

      it "is invalid, with errors set" 


      context "no error proc provided" do
        it "uses the default activereord error message" 

      end

      context "with an error proc"  do
        it "uses the message from the error proc" 

      end
    end

    context "blank hour/min" do
      let (:params)  { { date: "13 Apr 1992", hour: "", min: "" } }

      it "is invalid with errors set" 

    end
  end

  context "methods" do
    context "value" do
      context "valid object" do
        subject { DateTimeField.new date: "13 Apr 1992", hour: "9", min: "50" }

        it "returns a datetime object" 

      end

      context "invalid object" do
        subject { DateTimeField.new date: "BROKEN", hour: "VERY", min: "MUCH" }

        it "returns nil" 

      end

      context "built with ambiguous date" do
        subject { DateTimeField.new date: "4/5/1992", hour: "9", min: "50" }

        it "uses little endian parsing (British format)" 

      end
    end

    context "present?" do
      context "no fields filled in" do
        subject { DateTimeField.new }

        it "returns false" 

      end

      context "some filled in" do
        subject { DateTimeField.new date: "I am filled in but not necessarily valid" }

        it "returns true" 

      end
    end

    context "blank?" do
      context "no fields filled in" do
        subject { DateTimeField.new }

        it "returns true" 

      end

      context "some filled in" do
        subject { DateTimeField.new date: "I am filled in but not necessarily valid" }

        it "returns false" 

      end
    end
  end
end

