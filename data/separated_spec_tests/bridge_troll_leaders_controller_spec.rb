require 'rails_helper'

describe Regions::LeadersController do
  let(:region) { create :region }
  let(:leader) { create :user }
  let(:user) { create :user }

  describe "with a user who is not logged in" do
    it "can not edit, create, or delete an event organizer" 

  end

  describe "with a user who is not a region leader" do
    before { sign_in user }

    it "can not edit, create, or delete an event organizer" 

  end

  describe "with a logged-in user who is a region leader of this region" do
    before do
      RegionLeadership.create(user: user, region: region)
      sign_in user
    end

    describe "#index" do
      let!(:leadership) { RegionLeadership.create(user: leader, region: region) }

      it "grabs the right leaders" 

    end

    describe "#create" do
      let(:new_leader) { create :user }

      context "with good params" do
        let(:params) { { region_id: region, id: new_leader } }

        it "creates the new region leadership" 

      end
    end

    describe "#destroy" do
      let!(:leadership) { RegionLeadership.create(user: leader, region: region) }
      let(:params) { { region_id: region, id: leader } }

      it "deletes the region leadership" 

    end
  end

  describe "potential leaders" do
    before do
      sign_in create(:user, admin: true)
    end

    it "includes all users in the region not currently assigned as leaders" 

  end
end

