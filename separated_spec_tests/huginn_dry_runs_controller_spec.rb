require 'rails_helper'

describe Agents::DryRunsController do
  def valid_attributes(options = {})
    {
      type: "Agents::WebsiteAgent",
      name: "Something",
      options: agents(:bob_website_agent).options,
      source_ids: [agents(:bob_weather_agent).id, ""]
    }.merge(options)
  end

  before do
    sign_in users(:bob)
  end

  describe "GET index" do
    it "does not load any events without specifing sources" 


    context "does not load events when the agent is owned by a different user" do
      before do
        @agent = agents(:jane_website_agent)
        @agent.sources << @agent
        @agent.save!
        expect(@agent.events.count).not_to be(0)
      end

      it "for new agents" 


      it "for existing agents" 

    end

    context "loads the most recent events" do
      before do
        @agent = agents(:bob_website_agent)
        @agent.sources << @agent
        @agent.save!
      end

      it "load the most recent events when providing source ids" 


      it "loads the most recent events for a saved agent" 

    end
  end

  describe "POST create" do
    before do
      stub_request(:any, /xkcd/).to_return(body: File.read(Rails.root.join("spec/data_fixtures/xkcd.html")), status: 200)
    end

    it "does not actually create any agent, event or log" 


    it "does not actually update an agent" 


    it "accepts an event" 


    it "uses the memory of an existing Agent" 


    it 'sets created_at of the dry-runned event' 

  end
end

