require_relative '../helper'

describe "help" do
  before do
    @oldset = Pry.config.commands
    @set = Pry.config.commands = Pry::CommandSet.new do
      import Pry::Commands
    end
  end

  after do
    Pry.config.commands = @oldset
  end

  it 'should display help for a specific command' 


  it 'should display help for a regex command with a "listing"' 


  it 'should display help for a command with a spaces in its name' 


  it 'should display help for all commands with a description' 


  it "should sort the output of the 'help' command" 

end

