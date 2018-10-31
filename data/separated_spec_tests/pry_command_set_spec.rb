require_relative 'helper'

describe Pry::CommandSet do
  before do
    @set = Pry::CommandSet.new do
      import Pry::Commands
    end

    @ctx = {
      :target => binding,
      :command_set => @set,
      :pry_instance => Pry.new(output: StringIO.new)
    }
  end

  describe "[]=" do
    it "removes a command from the command set" 


    it "replaces a command" 


    it "rebinds the command with key" 


    it "raises a TypeError when command is not a subclass of Pry::Command" 

  end

  it 'should call the block used for the command when it is called' 


  it 'should pass arguments of the command to the block' 


  it 'should use the first argument as context' 


  it 'should raise an error when calling an undefined command' 


  it 'should be able to remove its own commands' 


  it 'should be able to remove its own commands, by listing name' 


  it 'should be able to import some commands from other sets' 


  it 'should return command set after import' 


  it 'should return command set after import_from' 


  it 'should be able to import some commands from other sets using listing name' 


  it 'should be able to import a whole set' 


  it 'should be able to import sets at creation' 


  it 'should set the descriptions of commands' 


  describe "aliases" do
    it 'should be able to alias command' 


    it "should be able to alias command with command_prefix" 


    it 'should inherit options from original command' 


    it 'should be able to specify alias\'s description when aliasing' 


    it "should be able to alias a command by its invocation line" 


    it "should be able to specify options when creating alias" 


    it "should set description to default if description parameter is nil" 

  end

  it 'should be able to change the descriptions of commands' 


  it 'should get the descriptions of commands' 


  it 'should get the descriptions of commands, by listing' 


  it 'should return Pry::Command::VOID_VALUE for commands by default' 


  it 'should be able to keep return values' 


  it 'should be able to keep return values, even if return value is nil' 


  it 'should be able to have its own helpers' 


  it 'should not recreate a new helper module when helpers is called' 


  it 'should import helpers from imported sets' 


  it 'should import helpers even if only some commands are imported' 


  it 'should provide a :listing for a command that defaults to its name' 


  it 'should provide a :listing for a command that differs from its name' 


  it "should provide a 'help' command" 



  describe "renaming a command" do
    it 'should be able to rename and run a command' 


    it 'should accept listing name when renaming a command' 


    it 'should raise exception trying to rename non-existent command' 


    it 'should make old command name inaccessible' 


    it 'should be able to pass in options when renaming command' 

  end

  describe "command decorators - before_command and after_command" do
    describe "before_command" do
      it 'should be called before the original command' 


      it 'should be called before the original command, using listing name' 


      it 'should share the context with the original command' 


      it 'should work when applied multiple times' 


    end

    describe "after_command" do
      it 'should be called after the original command' 


      it 'should be called after the original command, using listing name' 


      it 'should share the context with the original command' 


      it 'should determine the return value for the command' 


      it 'should work when applied multiple times' 

    end

    describe "before_command and after_command" do
      it 'should work when combining both before_command and after_command' 


    end

  end

  describe 'find_command' do
    it 'should find commands with the right string' 


    it 'should not find commands with spaces before' 


    it 'should find commands with arguments after' 


    it 'should find commands with names containing spaces' 


    it 'should find command defined by regex' 


    it 'should find commands defined by regex with arguments' 


    it 'should not find commands by listing' 


    it 'should not find commands without command_prefix' 


    it "should find commands that don't use the prefix" 


    it "should find the command that has the longest match" 


    it "should find the command that has the longest name" 

  end

  describe '.valid_command?' do
    it 'should be true for commands that can be found' 


    it 'should be false for commands that can\'' 


    it 'should not cause argument interpolation' 

  end

  describe '.process_line' do

    it 'should return Result.new(false) if there is no matching command' 


    it 'should return Result.new(true, VOID) if the command is not keep_retval' 


    it 'should return Result.new(true, retval) if the command is keep_retval' 


    it 'should pass through context' 


    it 'should add command_set to context' 

  end

  if defined?(Bond)
    describe '.complete' do
      it "should list all command names" 


      it "should delegate to commands" 

    end
  end
end

