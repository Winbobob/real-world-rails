require 'rails_helper'

describe ScenarioImport do
  let(:user) { users(:bob) }
  let(:guid) { "somescenarioguid" }
  let(:tag_fg_color) { "#ffffff" }
  let(:tag_bg_color) { "#000000" }
  let(:icon) { 'Star' }
  let(:description) { "This is a cool Huginn Scenario that does something useful!" }
  let(:name) { "A useful Scenario" }
  let(:source_url) { "http://example.com/scenarios/2/export.json" }
  let(:weather_agent_options) {
    {
      'api_key' => 'some-api-key',
      'location' => '12345'
    }
  }
  let(:trigger_agent_options) {
    {
      'expected_receive_period_in_days' => 2,
      'rules' => [{
                    'type' => "regex",
                    'value' => "rain|storm",
                    'path' => "conditions",
                  }],
      'message' => "Looks like rain!"
    }
  }
  let(:valid_parsed_weather_agent_data) do
    {
      :type => "Agents::WeatherAgent",
      :name => "a weather agent",
      :schedule => "5pm",
      :keep_events_for => 14.days,
      :disabled => true,
      :guid => "a-weather-agent",
      :options => weather_agent_options
    }
  end
  let(:valid_parsed_trigger_agent_data) do
    {
      :type => "Agents::TriggerAgent",
      :name => "listen for weather",
      :keep_events_for => 0,
      :propagate_immediately => true,
      :disabled => false,
      :guid => "a-trigger-agent",
      :options => trigger_agent_options
    }
  end
  let(:valid_parsed_basecamp_agent_data) do
    {
      :type => "Agents::BasecampAgent",
      :name => "Basecamp test",
      :schedule => "every_2m",
      :keep_events_for => 0,
      :propagate_immediately => true,
      :disabled => false,
      :guid => "a-basecamp-agent",
      :options => {project_id: 12345}
    }
  end
  let(:valid_parsed_data) do
    {
      schema_version: 1,
      name: name,
      description: description,
      guid: guid,
      tag_fg_color: tag_fg_color,
      tag_bg_color: tag_bg_color,
      icon: icon,
      source_url: source_url,
      exported_at: 2.days.ago.utc.iso8601,
      agents: [
        valid_parsed_weather_agent_data,
        valid_parsed_trigger_agent_data
      ],
      links: [
        { :source => 0, :receiver => 1 }
      ],
      control_links: []
    }
  end
  let(:valid_data) { valid_parsed_data.to_json }
  let(:invalid_data) { { :name => "some scenario missing a guid" }.to_json }

  describe "initialization" do
    it "is initialized with an attributes hash" 

  end

  describe "validations" do
    subject do
      _import = ScenarioImport.new
      _import.set_user(user)
      _import
    end

    it "is not valid when none of file, url, or data are present" 


    describe "data" do
      it "should be invalid with invalid data" 


      it "should be valid with valid data" 

    end

    describe "url" do
      it "should be invalid with an unreasonable URL" 


      it "should be invalid when the referenced url doesn't contain a scenario" 


      it "should be valid when the url points to a valid scenario" 

    end

    describe "file" do
      it "should be invalid when the uploaded file doesn't contain a scenario" 


      it "should be valid with a valid uploaded scenario" 

    end
  end

  describe "#dangerous?" do
    it "returns false on most Agents" 


    it "returns true if a ShellCommandAgent is present" 

  end

  describe "#import and #generate_diff" do
    let(:scenario_import) do
      _import = ScenarioImport.new(:data => valid_data)
      _import.set_user users(:bob)
      _import
    end

    context "when this scenario has never been seen before" do
      describe "#import" do
        it "makes a new scenario" 


        it "creates the Agents" 


        it "creates new Agents, even if one already exists with the given guid (so that we don't overwrite a user's work outside of the scenario)" 


        context "when the schema_version is less than 1" do
          before do
            valid_parsed_weather_agent_data[:keep_events_for] = 2
            valid_parsed_data.delete(:schema_version)
          end

          it "translates keep_events_for from days to seconds" 

        end

        describe "with control links" do
          it 'creates the links' 


          it "doesn't crash without any control links" 

        end
      end

      describe "#generate_diff" do
        it "returns AgentDiff objects for the incoming Agents" 

      end
    end

    context "when an a scenario already exists with the given guid for the importing user" do
      let!(:existing_scenario) do
        _existing_scenerio = users(:bob).scenarios.build(:name => "an existing scenario", :description => "something")
        _existing_scenerio.guid = guid
        _existing_scenerio.save!

        agents(:bob_weather_agent).update_attribute :guid, "a-weather-agent"
        agents(:bob_weather_agent).scenarios << _existing_scenerio

        _existing_scenerio
      end

      describe "#import" do
        it "uses the existing scenario, updating its data" 


        it "updates any existing agents in the scenario, and makes new ones as needed" 


        it "honors updates coming from the UI" 


        it "adds errors when updated agents are invalid" 

      end

      describe "#generate_diff" do
        it "returns AgentDiff objects that include 'current' values from any agents that already exist" 


        context "when the schema_version is less than 1" do
          it "translates keep_events_for from days to seconds" 

        end

        it "sets the 'updated' FieldDiff values based on any feedback from the user" 


        it "adds errors on validation when updated options are unparsable" 

      end
    end

    context "when Bob imports Jane's scenario" do
      let!(:existing_scenario) do
        _existing_scenerio = users(:jane).scenarios.build(:name => "an existing scenario", :description => "something")
        _existing_scenerio.guid = guid
        _existing_scenerio.save!
        _existing_scenerio
      end

      describe "#import" do
        it "makes a new scenario for Bob" 


        it "does not change Jane's scenario" 

      end
    end

    context "agents which require a service" do
      let(:valid_parsed_services) do
        data = valid_parsed_data
        data[:agents] = [valid_parsed_basecamp_agent_data,
                         valid_parsed_trigger_agent_data]
        data
      end

      let(:valid_parsed_services_data) { valid_parsed_services.to_json }

      let(:services_scenario_import) {
        _import = ScenarioImport.new(:data => valid_parsed_services_data)
        _import.set_user users(:bob)
        _import
      }

      describe "#generate_diff" do
        it "should check if the agent requires a service" 


        it "should add an error when no service is selected" 

      end

      describe "#import" do
        it "should import" 

      end
    end
  end
end

