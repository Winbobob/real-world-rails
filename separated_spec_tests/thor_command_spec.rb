require "helper"

describe Thor::Command do
  def command(options = {})
    options.each do |key, value|
      options[key] = Thor::Option.parse(key, value)
    end

    @command ||= Thor::Command.new(:can_has, "I can has cheezburger", "I can has cheezburger\nLots and lots of it", "can_has", options)
  end

  describe "#formatted_usage" do
    it "includes namespace within usage" 


    it "includes subcommand name within subcommand usage" 


    it "removes default from namespace" 


    it "injects arguments into usage" 

  end

  describe "#dynamic" do
    it "creates a dynamic command with the given name" 


    it "does not invoke an existing method" 

  end

  describe "#dup" do
    it "dup options hash" 

  end

  describe "#run" do
    it "runs a command by calling a method in the given instance" 


    it "raises an error if the method to be invoked is private" 

  end
end

