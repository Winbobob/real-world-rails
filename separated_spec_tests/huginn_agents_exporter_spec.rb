require 'rails_helper'

describe AgentsExporter do
  describe "#as_json" do
    let(:name) { "My set of Agents" }
    let(:description) { "These Agents work together nicely!" }
    let(:guid) { "some-guid" }
    let(:tag_fg_color) { "#ffffff" }
    let(:tag_bg_color) { "#000000" }
    let(:icon) { 'Camera' }
    let(:source_url) { "http://yourhuginn.com/scenarios/2/export.json" }
    let(:agent_list) { [agents(:jane_weather_agent), agents(:jane_rain_notifier_agent)] }
    let(:exporter) { AgentsExporter.new(
      agents: agent_list, name: name, description: description,
      source_url: source_url, guid: guid, tag_fg_color: tag_fg_color,
      tag_bg_color: tag_bg_color, icon: icon) }

    it "outputs a structure containing name, description, the date, all agents & their links" 


    it "does not output links to other agents outside of the incoming set" 


    it "outputs control links to agents within the incoming set, but not outside it" 

  end

  describe "#filename" do
    it "strips special characters" 


    it "strips punctuation" 


    it "strips leading and trailing dashes" 


    it "has a default when options[:name] is nil" 


    it "has a default when the result is empty" 

  end

  def guid_order(agent_list, agent_name)
    agent_list.map{|a|a.guid}.sort.find_index(agents(agent_name).guid)
  end
end

