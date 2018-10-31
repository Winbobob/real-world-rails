require 'spec_helper'

describe ApiV1::PeopleController do
  before do
    make_a_typical_project
  end

  describe "#index" do
    it "shows people in the project" 


    it "shows people in the project referenced by id" 


    it "limits memberships" 


    it "limit can be overridden" 


    it "limits and offsets people" 

  end

  describe "#show" do
    it "shows a person with references" 

  end

  describe "#update" do
    it "should allow an admin to modify a person" 


    it "should not allow a non-admin to modify a person" 

    
    it "should ensure the last admin isn't updated out of the project" 

  end

  describe "#destroy" do
    it "should allow an admin to destroy a person" 


    it "should allow a user to remove themselves from the project" 


    it "should not allow a non-admin to destroy another person" 

    
    it "should not destroy the last person in a project" 

  end
end

