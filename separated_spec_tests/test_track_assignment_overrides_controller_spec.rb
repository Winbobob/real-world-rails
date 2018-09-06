require 'rails_helper'

RSpec.describe Api::V1::AssignmentOverridesController, type: :controller do
  describe "#create" do
    let!(:visitor) { FactoryBot.create :visitor }
    let(:split) { FactoryBot.create(:split, registry: { control: 50, treatment: 50 }) }

    let(:create_params) do
      {
        visitor_id: visitor.id,
        split_name: split.name,
        variant: "treatment",
        mixpanel_result: "success",
        context: "context"
      }
    end

    it "raises when there is no BROWSER_EXTENSION_SHARED_SECRET" 


    it "raises when there is an empty BROWSER_EXTENSION_SHARED_SECRET" 


    context "when configured with a BROWSER_EXTENSION_SHARED_SECRET" do
      around do |example|
        with_env BROWSER_EXTENSION_SHARED_SECRET: "the best password" do
          example.run
        end
      end

      context "when correctly authenticated" do
        before do
          http_authenticate username: "doesn't matter", auth_secret: "the best password"
        end

        it "creates an assignment if none already exists" 


        it "overrides an assignment if one already exists" 


        it "allows a request without a mixpanel_result" 

      end

      it "returns unauthorized and doesn't create an assignment with the wrong password" 


      it "returns unauthorized and doesn't create an assignment with no password" 

    end
  end
end

