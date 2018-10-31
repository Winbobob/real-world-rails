# frozen_string_literal: true

require "spec_helper"

describe AdminServices::Destroy do
  let(:team_one) { create(:team) }
  let(:team_two) { create(:team) }
  let(:admin) { create(:admin, team: team_one) }
  let(:current_admin) { create(:admin, team: team_one) }
  let(:remove_admin) do
    AdminServices::Destroy.call(current_admin: current_admin, id: admin.id)
  end

  it "should remove an admin" 


  it "should return the removed admin as the result" 


  it "should be successful" 


  context "admin is in another team" do
    let(:admin) { create(:admin, team: team_two) }

    it "should raise an error" 

  end

  context "admin doesn't exist" do
    before(:each) { admin.destroy! }

    it "should raise an error" 

  end
end

