require 'rails_helper'

RSpec.describe Api::V1::AssignmentEventsController, type: :controller do
  describe "#create" do
    let!(:visitor) { FactoryBot.create(:visitor, id: "7ab083a5-d532-4bd6-912f-aa7e887450da") }
    let(:split) { FactoryBot.create(:split, name: "my_split", registry: { control: 47, treatment: 1, zombie_apocalypse: 52 }) }

    let(:create_params) do
      {
        visitor_id: visitor.id,
        split_name: split.name,
        mixpanel_result: "success",
        context: "context"
      }
    end

    it "creates an assignment if none already exists" 


    it "noops if a conflicting assignment already exists" 


    it "allows a request without a mixpanel_result" 

  end
end

