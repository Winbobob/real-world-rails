require 'spec_helper'

describe ApiV1::OrganizationsController do
  before do
    make_a_typical_project

    @other_org = Organization.create!(:name => 'FOOOO', :permalink => 'foooo')
    @other_org.add_member(@user)
  end

  describe "#index" do
    it "shows organizations the user belongs to" 


    it "does not show organizations the user doesn't belong to unless specified" 


    it "returns references for linked objects" 


    it "limits organizations" 


    it "limits and offsets organizations" 

  end

  describe "#create" do
    it "creates an organization" 

  end

  describe "#update" do
    it "should allow an admin to update the organization" 


    it "should not allow a non-admin to update the organization" 

  end

  describe "#show" do
    it "shows an organization with references" 


    it "shows an organization by id" 


    it "should not show an organization the user doesn't belong to" 

  end
end

