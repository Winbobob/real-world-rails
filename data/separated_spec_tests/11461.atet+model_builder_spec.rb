require 'rails_helper'

RSpec.describe AdditionalClaimantsCsv::ModelBuilder, type: :service do

  let(:additional_claimants_csv_builder) { described_class.new }
  let(:row) { ['Mr', 'Timothy', 'Crotchet', '18/09/1937', '69', 'SomeStreet', 'Motown', 'County', 'SE17NX'] }
  let(:model_class) { AdditionalClaimantsForm::AdditionalClaimant }
  let(:expected_attributes) {
    {
      title: "mr",
      first_name: "timothy",
      last_name: "crotchet",
      date_of_birth: Date.parse("18/09/1937"),
      address_building: "69",
      address_street: "somestreet",
      address_locality: "motown",
      address_county: "county",
      address_post_code: "se17nx"
    }.stringify_keys
  }

  describe "attributes constant" do
    it "is defined with a list of symbols" 

  end

  describe "#build" do
    it "returns an additional claimant model" 


    it "sets attributes on the returned model" 


    it "doesn't create multiple form objects" 

  end
end

