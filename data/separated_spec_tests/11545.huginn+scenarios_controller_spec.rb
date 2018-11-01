require 'rails_helper'

describe ScenariosController do
  def valid_attributes(options = {})
    { :name => "some_name" }.merge(options)
  end

  before do
    sign_in users(:bob)
  end

  describe "GET index" do
    it "only returns Scenarios for the current user" 

  end

  describe "GET show" do
    it "only shows Scenarios for the current user" 


    it "loads Agents for the requested Scenario" 

  end

  describe "GET share" do
    it "only displays Scenario share information for the current user" 

  end

  describe "GET export" do
    it "returns a JSON file download from an instantiated AgentsExporter" 


    it "only exports private Scenarios for the current user" 


    describe "public exports" do
      before do
        scenarios(:jane_weather).update_attribute :public, true
      end

      it "exports public scenarios for other users when logged in" 


      it "exports public scenarios for other users when logged out" 

    end
  end

  describe "GET edit" do
    it "only shows Scenarios for the current user" 

  end

  describe "POST create" do
    it "creates Scenarios for the current user" 


    it "shows errors" 


    it "will not create Scenarios for other users" 

  end

  describe "PUT update" do
    it "updates attributes on Scenarios for the current user" 


    it "shows errors" 


    it 'adds an agent to the scenario' 

  end

  describe 'PUT enable_or_disable_all_agents' do
    it 'updates disabled on all agents in a scenario for the current user' 

  end

  describe "DELETE destroy" do
    it "destroys only Scenarios owned by the current user" 


    it "passes the mode to the model" 

  end
end

