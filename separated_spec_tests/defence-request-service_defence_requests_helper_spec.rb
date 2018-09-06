require "rails_helper"

require "timecop"

RSpec.describe DefenceRequestsHelper, type: :helper do

  describe "formatting Not given field" do
    context "when address is Not given" do
      context "i18n translation for Not given is specified" do
        it "returns the specified translation" 

      end

      context "i18n translation is not specified" do
        it "returns 'Not given'" 

      end
    end

    context "when address present" do
      it "returns address as single line" 

    end
  end

  describe "formatting Not given date" do
    context "when date is Not given" do
      it "returns 'Not given'" 

    end

    context "when address present" do
      it "returns date as correctly formatted" 

    end
  end

  describe "interview_at" do
    let(:now) { Time.parse("2015-06-02 15:20 GMT")}
    let(:request) { create(:defence_request, interview_start_time: time) }
    subject do
      Timecop.freeze(now) do
        helper.interview_at(request)
      end
    end

    context "when blank" do
      let(:time) { nil }

      it "renders correctly" 

    end

    context "when set" do
      context "is today" do
        let(:time) { Time.parse("2015-06-02 18:20 GMT") }

        it "renders just the time" 

      end

      context "is not today" do
        let(:time) { Time.parse("2015-06-03 18:20 GMT") }

        it "renders the date and the time" 

      end
    end
  end

  describe "label_text_for_form" do
    context "when the label is optional" do
      it "renders the translation of the attribute name" 

    end

    context "when the label is required" do
      it "renders the translation of the attribute name" 

    end
  end
end

