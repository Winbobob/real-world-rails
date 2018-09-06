require "rails_helper"

RSpec.describe DateField do

  context "from persisted value" do
    subject { DateField.from_persisted_value date }
    context "presisted value is present" do
      let(:date) { Date.parse "13-04-1992" }

      it "has the same fields as the original" 

    end

    context "presisted value is nil" do
      let(:date) { nil }

      it "has no fields set" 

    end
  end

  context "from params" do
    subject { DateField.new params }

    context "valid params" do
      let(:params) { { day: "13", month: "4", year: "1992" } }

      it "is valid, with correct attributes" 

    end

    context "invalid params" do
      let (:params) { { day: "I", month: "AM", year: "BROKEN" } }

      context "no error proc provided"  do
        it "uses the default activerecord error message" 

      end

      context "no error proc provided"  do
        it "uses the default activerecord error message" 

      end
    end
  end

  context "methods" do
    context "value" do
      context "valid object" do
        subject { DateField.new day: "13", month: "4", year: "1992" }

        it "returns a date object" 

      end

      context "invalid object" do
        subject { DateField.new day: "I", month: "AM", year: "BROKEN" }

        it "returns nil" 

      end
    end

    context "present?" do
      context "no fields filled in" do
        subject { DateField.new }

        it "returns false" 

      end

      context "some filled in" do
        subject { DateField.new day: "I am filled in but not necessarily valid" }

        it "returns true" 

      end
    end

    context "blank?" do
      context "no fields filled in" do
        subject { DateField.new }

        it "returns true" 

      end

      context "some filled in" do
        subject { DateField.new day: "I am filled in but not necessarily valid" }

        it "returns false" 

      end
    end
  end

end

