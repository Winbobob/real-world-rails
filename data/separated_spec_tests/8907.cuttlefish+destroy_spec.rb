# frozen_string_literal: true

require "spec_helper"

describe DenyListServices::Destroy do
  let(:team) { create(:team) }
  let(:current_admin) { create(:admin, team: team) }
  let(:deny_list) { create(:deny_list, team: team) }
  let(:destroy_deny_list) do
    DenyListServices::Destroy.call(
      current_admin: current_admin, id: deny_list.id
    )
  end

  it "should remove a deny list entry" 


  it "should return the deleted entry" 


  context "entry does not exist" do
    before(:each) { deny_list.destroy! }

    it "should error" 

  end

  context "does not have permission" do
    let(:deny_list_policy) { double }
    before :each do
      expect(DenyListPolicy).to receive(:new) { deny_list_policy }
      expect(deny_list_policy).to receive(:destroy?) { false }
    end

    it "should error" 

  end
end

