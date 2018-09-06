require 'spec_helper'

describe DivisionsController, type: :controller do
  describe "#index" do
    # TODO: Remove this hack to delete fixtures
    before :each do
      Division.delete_all
      Member.delete_all
    end

    let!(:december_2016_division)  { create(:division, date: Date.new(2016,12,25)) }
    let!(:june_2016_division)  { create(:division, date: Date.new(2016,06,01)) }
    let!(:older_division)  { create(:division, date: Date.new(2013,04,29)) }

    let!(:representative) { create(:member, house: "representatives", constituency: "Newtown") }

    context "when there are no parameters" do
      it "should render index template with divisions of the same year as the last one stored" 

    end

    context "when request has an invalid date as a parameter" do
      it "should return generic 404 page" 

    end

    context "when request has an date parameter with an incorrect format" do
      it "should return generic 404 page" 

    end

    context "when the date parameter is a full date" do
      context "and date matches divisions already stored" do
        it "should render index template with selected divisions" 

      end

      context "and date does not match any divisions" do
        it "should render index template with empty divisions" 

      end
    end

    context "when the date parameter is just a year" do
      context "and date matches divisions already stored" do
        it "should render index template with selected divisions" 

      end

      context "and date does not match any divisions" do
        it "should render index template with empty divisions" 

      end
    end

    context "when the date parameter is just a year and a month (YYYY-MM)" do
      context "and date matches divisions already stored" do
        it "should render index template with selected divisions" 

      end

      context "and date does not match any divisions" do
        it "should render index template with empty divisions" 

      end
    end

    context "when request to see votes from a member" do
      context "and no date is specified" do
        it "should get votes based on last year on divisions table" 

      end

      context "and a date is specified" do
        context "and date is valid" do
          it "should get votes based on the date specified" 

        end

        context "and date is not valid" do
          it "should return generic 404 page" 

        end
      end
    end
  end

  describe "#show" do
    before :each do
      DivisionInfo.delete_all
      Whip.delete_all
      Vote.delete_all
      Member.delete_all
      Division.delete_all
    end

    let!(:one_division) { create(:division, date: Date.new(2017,04,06), house: "representatives", number: 100) }

    context "when request a specific division" do
      context "and parameters are match a division" do
        it "should load it" 

      end

      context "and parameters do not match a division" do
        it "should display a 404 page" 

      end
    end
  end
end

