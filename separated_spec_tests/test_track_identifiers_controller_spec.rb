require 'rails_helper'

RSpec.describe Api::V1::IdentifiersController, type: :controller do
  describe "#create" do
    let(:visitor) { FactoryBot.create(:visitor) }
    let(:identifier_type) { FactoryBot.create(:identifier_type) }

    let(:banana_split) { FactoryBot.create(:split, name: :banana, registry: { green: 50, squishy: 50 }) }

    it "responds with assigned variants for the visitor" 


    it "responds with mixpanel_failure_assignments for copied assignments" 


    it "responds with an error if given an invalid identifier_type" 

  end
end

