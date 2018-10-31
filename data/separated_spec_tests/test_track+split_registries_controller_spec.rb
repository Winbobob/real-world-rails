require 'rails_helper'

RSpec.describe Api::V2::SplitRegistriesController, type: :controller do
  let(:split_1) { FactoryBot.create :split, name: "one", finished_at: Time.zone.now, registry: { all: 100 } }
  let(:split_2) { FactoryBot.create :split, name: "two", registry: { on: 50, off: 50 } }
  let(:split_3) { FactoryBot.create :split, name: "three_enabled", registry: { true: 99, false: 1 }, feature_gate: true }

  describe "#show" do
    before do
      allow(SplitRegistry.instance).to receive(:experience_sampling_weight).and_return(10)
    end

    it "includes sampling weight" 


    it "returns empty with no active splits" 


    it "returns the full split registry" 

  end
end

