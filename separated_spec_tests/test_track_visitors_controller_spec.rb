require 'rails_helper'

RSpec.describe Api::V1::VisitorsController, type: :controller do
  describe "#show" do
    let(:visitor) { FactoryBot.create :visitor }

    let(:split_1) { FactoryBot.create(:split, name: "one", registry: { "control": 50, "treatment": 50 }) }
    let(:split_2) { FactoryBot.create(:split, name: "two", registry: { "control": 50, "treatment": 50 }) }

    let(:allow_signup) { FactoryBot.create(:split, name: "allow_signup", registry: { true: 50, false: 50 }) }

    context "with multiple assignments" do
      before do
        FactoryBot.create(:assignment,
          visitor: visitor,
          split: split_1,
          variant: "control",
          context: "context_a",
          mixpanel_result: "success")
        FactoryBot.create(:assignment,
          visitor: visitor,
          split: split_2,
          variant: "treatment",
          context: "context_b",
          mixpanel_result: "success")
        FactoryBot.create(:assignment,
          visitor: visitor,
          split: allow_signup,
          variant: :true,
          context: "context_c",
          mixpanel_result: "failure")
      end

      it "responds with all assigned variants" 


      it "only queries once per table (visitor, assignment, and split)" 

    end

    it "responds with empty assignments if visitor has no assignments" 


    it "echoes back the provided visitor id if visitor doesn't exist" 

  end
end

