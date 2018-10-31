require 'rails_helper'

describe LiquidMigrator do
  describe "converting JSONPath strings" do
    it "should work" 


    it "should ignore strings which just contain a JSONPath" 

    it "should raise an exception when encountering complex JSONPaths" 

  end

  describe "converting escaped JSONPath strings" do
    it "should work" 


    it "should convert the 'escape' method correctly" 


    it "should raise an exception when encountering complex JSONPaths" 

  end

  describe "migrating a hash" do
    it "should convert every attribute" 

    it "should work with leading_dollarsign_is_jsonpath" 

    it "should use the corresponding *_path attributes when using merge_path_attributes"do
      expect(LiquidMigrator.convert_hash({'a' => "default", 'a_path' => "$.data"}, {leading_dollarsign_is_jsonpath: true, merge_path_attributes: true})).to eq(
                                  {'a' => "{{data}}"}
      )
    end
    it "should raise an exception when encountering complex JSONPaths" 

  end

  describe "migrating the 'make_message' format" do
    it "should work" 

  end

  describe "migrating an actual agent" do
    before do
      valid_params = {
                        'auth_token' => 'token',
                        'room_name' => 'test',
                        'room_name_path' => '',
                        'username' => "Huginn",
                        'username_path' => '$.username',
                        'message' => "Hello from Huginn!",
                        'message_path' => '$.message',
                        'notify' => false,
                        'notify_path' => '',
                        'color' => 'yellow',
                        'color_path' => '',
                      }

      @agent = Agents::HipchatAgent.new(:name => "somename", :options => valid_params)
      @agent.user = users(:jane)
      @agent.save!
    end

    it "should work" 


    it "should work with nested hashes" 


    it "should work with nested arrays" 


    it "should raise an exception when encountering complex JSONPaths" 


    it "should work with the human task agent" 

  end
end

