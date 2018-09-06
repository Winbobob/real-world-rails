require 'rails_helper'

describe "Creating a new agent", js: true do
  before(:each) do
    login_as(users(:bob))
  end

  it "creates an agent" 


  context "with associated agents" do
    let!(:bob_scheduler_agent) {
      Agents::SchedulerAgent.create!(
        user: users(:bob),
        name: 'Example Scheduler',
        options: {
          'action' => 'run',
          'schedule' => '0 * * * *'
        },
      )
    }

    let!(:bob_weather_agent) {
      agents(:bob_weather_agent)
    }

    let!(:bob_formatting_agent) {
      agents(:bob_formatting_agent).tap { |agent|
        # Make this valid
        agent.options['instructions']['foo'] = 'bar'
        agent.save!
      }
    }

    it "creates an agent with a source and a receiver" 


    it "creates an agent with a control target" 


    it "creates an agent with a controller" 

  end

  it "creates an alert if a new agent with invalid json is submitted" 


  context "displaying the correct information" do
    before(:each) do
      visit new_agent_path
    end

    it "shows all options for agents that can be scheduled, create and receive events" 


    it "does not show the target select2 field when the agent can not create events" 

  end

  it "allows to click on on the agent name in select2 tags" 


  context "clearing unsupported fields of agents" do
    before do
      visit new_agent_path
    end

    it "does not send previously configured sources when the current agent does not support them" 


    it "does not send previously configured control targets when the current agent does not support them" 


    it "does not send previously configured receivers when the current agent does not support them" 

  end
end

