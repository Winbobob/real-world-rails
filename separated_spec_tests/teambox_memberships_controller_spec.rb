require 'spec_helper'

describe ApiV1::MembershipsController do
  before do
    make_a_typical_project

    @other_user = Factory.create(:user)
    @organization.add_member(@other_user)
  end

  describe "#index" do
    it "shows members in the organization" 


    it "shows members in the organization referenced by id" 


    it "returns references for linked objects" 


    it "limits memberships" 


    it "limits and offsets memberships" 

  end

  describe "#show" do
    it "shows a member with references" 

  end

  describe "#update" do
    it "should allow an admin to modify a member" 


    it "should not allow a non-admin to modify a member" 

  end

  describe "#destroy" do
    it "should allow an admin to destroy a member" 


    it "should not allow to delete the last admin" 


    it "should allow a user to remove themselves from the organization" 


    it "should not allow a non-admin to destroy another member" 

  end
end

