require_relative 'helper'


describe "commands" do
  before do
    @str_output = StringIO.new
    @o = Object.new

    # Shortcuts. They save a lot of typing.
    @bs1 = "Pad.bs1 = _pry_.binding_stack.dup"
    @bs2 = "Pad.bs2 = _pry_.binding_stack.dup"
    @bs3 = "Pad.bs3 = _pry_.binding_stack.dup"

    @self  = "Pad.self = self"

    @command_tester = Pry::CommandSet.new do
      command "command1", "command 1 test" do
        output.puts "command1"
      end

      command "command2", "command 2 test" do |arg|
        output.puts arg
      end
    end

    Pad.bong = "bong"
  end

  after do
    Pad.clear
    Pry.reset_defaults
  end

  describe "alias_command" do
    it 'should make an aliasd command behave like its original' 


    it 'should pass on arguments to original' 


    it 'should pass option arguments to original' 


    it 'should pass option arguments to original with additional parameters' 


    it 'should be able to alias a regex command' 


    it 'should be able to make the alias a regex' 

  end

  describe "Pry::Command#run" do
    it 'should allow running of commands with following whitespace' 


    it 'should allow running of cd command when contained in a single string' 


    it 'should allow running of cd command when split into array' 


    it 'should run a command from within a command' 


    it 'should run a regex command from within a command' 


    it 'should run a command from within a command with arguments' 

  end

  describe "Pry#run_command" do
    it 'should run a command that modifies the passed in eval_string' 


    it 'should run a command in the context of a session' 

  end

  it 'should interpolate ruby code into commands' 


  # bug fix for https://github.com/pry/pry/issues/170
  it 'should not choke on complex string interpolation when checking if ruby code is a command' 


  it 'should NOT interpolate ruby code into commands if :interpolate => false' 


  it 'should NOT try to interpolate pure ruby code (no commands) ' 


  it 'should create a command with a space in its name zzz' 


  it 'should create a command with a space in its name and pass an argument' 


  it 'should create a regex command and be able to invoke it' 


  it 'should create a regex command and pass captures into the args list before regular arguments' 


  it 'should create a regex command and interpolate the captures' 


  it 'should create a regex command and arg_string should be interpolated' 


  it 'if a regex capture is missing it should be nil' 


  it 'should create a command in a nested context and that command should be accessible from the parent' 


  it 'should define a command that keeps its return value' 


  it 'should define a command that does NOT keep its return value' 


  it 'should define a command that keeps its return value even when nil' 


  it 'should define a command that keeps its return value but does not return when value is void' 


  it 'a command (with :keep_retval => false) that replaces eval_string with a valid expression should not have the expression value suppressed' 


  it 'a command (with :keep_retval => true) that replaces eval_string with a valid expression should overwrite the eval_string with the return value' 


  it 'a command that return a value in a multi-line expression should clear the expression and return the value' 


  it 'should set the commands default, and the default should be overridable' 


  it 'should inherit commands from Pry::Commands' 


  it 'should change description of a command using desc' 


  it 'should enable an inherited method to access opts and output and target, due to instance_exec' 


  it 'should import commands from another command object' 


  it 'should delete some inherited commands when using delete method' 


  it 'should override some inherited commands' 


  it 'should run a command with no parameter' 


  it 'should run a command with one parameter' 

end

