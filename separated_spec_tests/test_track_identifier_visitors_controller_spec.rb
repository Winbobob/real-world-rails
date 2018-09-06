require 'rails_helper'

RSpec.describe Api::V1::IdentifierVisitorsController, type: :controller do
  describe "#show" do
    let(:identifier_type) { FactoryBot.create(:identifier_type, name: "clown_id") }
    let(:split) { FactoryBot.create(:split, name: "what_time_is_it") }
    let(:assignment) do
      FactoryBot.create(:assignment, split: split, variant: :hammer_time, context: "the_context", mixpanel_result: "success")
    end
    let!(:identifier) { FactoryBot.create(:identifier, identifier_type: identifier_type, value: "1234", visitor: assignment.visitor) }

    it "responds with a visitor" 


    it "responds with an empty assignments list for visitor with no assignments" 

  end
end

