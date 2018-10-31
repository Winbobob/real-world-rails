require 'rails_helper'

describe AgentsController do
  def valid_attributes(options = {})
    {
        :type => "Agents::WebsiteAgent",
        :name => "Something",
        :options => agents(:bob_website_agent).options,
        :source_ids => [agents(:bob_weather_agent).id, ""]
    }.merge(options)
  end

  describe "GET index" do
    it "only returns Agents for the current user" 


    it "should not show disabled agents if the cookie is set" 

  end

  describe "POST handle_details_post" do
    it "passes control to handle_details_post on the agent" 


    it "can only be accessed by the Agent's owner" 

  end

  describe "POST run" do
    it "triggers Agent.async_check with the Agent's ID" 


    it "can only be accessed by the Agent's owner" 

  end

  describe "POST remove_events" do
    it "deletes all events created by the given Agent" 


    it "can only be accessed by the Agent's owner" 

  end

  describe "PUT toggle_visibility" do
    it "should set the cookie" 


    it "should delete the cookie" 

  end

  describe "POST propagate" do
    before(:each) do
      sign_in users(:bob)
    end

    it "runs event propagation for all Agents" 


    it "does not run the propagation when a job is already enqueued" 

  end

  describe "GET show" do
    it "only shows Agents for the current user" 

  end

  describe "GET new" do
    describe "with :id" do
      it "opens a clone of a given Agent" 


      it "only allows the current user to clone his own Agent" 

    end

    describe "with a scenario_id" do
      it 'populates the assigned agent with the scenario' 


      it "does not see other user's scenarios" 

    end
  end

  describe "GET edit" do
    it "only shows Agents for the current user" 

  end

  describe "POST create" do
    it "errors on bad types" 


    it "creates Agents for the current user" 


    it "creates Agents and accepts specifing a target agent" 


    it "shows errors" 


    it "will not accept Agent sources owned by other users" 

  end

  describe "PUT update" do
    it "does not allow changing types" 


    it "updates attributes on Agents for the current user" 


    it "accepts JSON requests" 


    it "will not accept Agent sources owned by other users" 


    it "will not accept Scenarios owned by other users" 


    it "shows errors" 


    it 'does not allow to modify the agents user_id' 


    describe "redirecting back" do
      before do
        sign_in users(:bob)
      end

      it "can redirect back to the show path" 


      it "redirect back to the index path by default" 


      it "accepts return paths to scenarios" 


      it "sanitizes return paths" 

    end

    it "updates last_checked_event_id when drop_pending_events is given" 

  end

  describe "PUT leave_scenario" do
    it "removes an Agent from the given Scenario for the current user" 

  end

  describe "DELETE destroy" do
    it "destroys only Agents owned by the current user" 


    it "redirects correctly when the Agent is deleted from the Agent itself" 


    it "redirects correctly when the Agent is deleted from a Scenario" 

  end

  describe "#form_configurable actions" do
    before(:each) do
      @params = {attribute: 'auth_token', agent: valid_attributes(:type => "Agents::HipchatAgent", options: {auth_token: '12345'})}
      sign_in users(:bob)
    end
    describe "POST validate" do

      it "returns with status 200 when called with a valid option" 


      it "returns with status 403 when called with an invalid option" 

    end

    describe "POST complete" do
      it "callsAgent#complete_option and renders json" 

    end
  end

  describe "DELETE memory" do
    it "clears memory of the agent" 


    it "does not clear memory of an agent not owned by the current user" 

  end

  describe 'DELETE undefined' do
    it 'removes an undefined agent from the database' 

  end
end

