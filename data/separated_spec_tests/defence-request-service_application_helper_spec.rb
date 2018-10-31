require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do

  describe "#display_value" do
    context "when value blank" do
      it "renders localized label and '-' for value" 

    end

    context "when value present" do
      it "renders localized label and value" 

    end

    context "when id specified" do
      it "renders localized label and value with id set" 

    end
  end

  describe "date_and_time_formatter" do
    let(:date) { Time.parse("2015-05-28 15:50:21") }

    it "renders time and date in the correct format" 

  end
end

