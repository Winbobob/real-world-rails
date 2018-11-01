require 'spec_helper'

describe CourtsHelper do
  describe "Court numbers display helper" do
    let(:court1) { create(:court, name: 'London Court') }
    let(:court2) { create(:court, name: 'London Court', court_number: 2434) }
    let(:court3) { create(:court, name: 'London Court', cci_code: 980) }
    let(:court4) { create(:court, name: 'London Court', court_number: 2434, cci_code: 980) }
    let(:court5) { create(:court, name: 'London Court', court_number: 899, cci_code: 899) }

    context "when a court has neither court_number nor cci_code" do
      it "displays an empty string for short form" 


      it "displays an empty string for long form" 

    end

    context "when court has only court_number and no cci_code" do
      it "displays just the court_number for short form" 


      it "displays just the court_number for long form" 

    end

    context "when court has only cci_code and no court_number" do
      it "displays just the cci_code for short form" 


      it "displays just the cci_code for long form" 

    end

    context "when court has court_number and cci_code" do
      it "it displays both the court_number and cci_code for short form" 

      it "displays both the court_number and cci_code for long form" 

    end

    context "when cci_code exists but is the same as the court_number" do
      it "displays just the court_number for short form" 

      it "displays just the court_number for long form" 

    end
  end

  describe "towns_with_county_where_duplicates_exist" do
    let(:town1) { Town.new(name: 'town 1') }
    let(:town2) { Town.new(name: 'town 2') }
    let(:towns) { [town1, town2] }
    before { Town.stub(with_county_name: Town, with_duplicate_count: Town, select: towns) }

    it "gets the Towns with county name" 


    it "gets the Towns with duplicate count" 


    it "manually selects the towns.id and towns.name" 


    describe "each returned town" do

      it "is mapped to a new TownDisambiguator" 

    end
  end

  describe 'family_areas_of_law' do
    it "call selected areas of law" 

  end
end

