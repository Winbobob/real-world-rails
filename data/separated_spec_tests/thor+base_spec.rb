require "helper"
require "thor/base"

class Amazing
  desc "hello", "say hello"
  def hello
    puts "Hello"
  end
end

describe Thor::Base do
  describe "#initialize" do
    it "sets arguments array" 


    it "sets arguments default values" 


    it "sets options default values" 


    it "allows options to be given as symbols or strings" 


    it "creates options with indifferent access" 


    it "creates options with magic predicates" 

  end

  describe "#no_commands" do
    it "avoids methods being added as commands" 

  end

  describe "#argument" do
    it "sets a value as required and creates an accessor for it" 


    it "does not set a value in the options hash" 

  end

  describe "#arguments" do
    it "returns the arguments for the class" 

  end

  describe ":aliases" do
    it "supports string aliases without a dash prefix" 


    it "supports symbol aliases" 

  end

  describe "#class_option" do
    it "sets options class wise" 


    it "does not create an accessor for it" 

  end

  describe "#class_options" do
    it "sets default options overwriting superclass definitions" 

  end

  describe "#remove_argument" do
    it "removes previously defined arguments from class" 


    it "undefine accessors if required" 

  end

  describe "#remove_class_option" do
    it "removes previous defined class option" 

  end

  describe "#class_options_help" do
    before do
      @content = capture(:stdout) { MyCounter.help(Thor::Base.shell.new) }
    end

    it "shows option's description" 


    it "shows usage with banner content" 


    it "shows default values below descriptions" 


    it "shows options in different groups" 


    it "use padding in options that do not have aliases" 


    it "allows extra options to be given" 


    it "displays choices for enums" 

  end

  describe "#namespace" do
    it "returns the default class namespace" 


    it "sets a namespace to the class" 

  end

  describe "#group" do
    it "sets a group" 


    it "inherits the group from parent" 


    it "defaults to standard if no group is given" 

  end

  describe "#subclasses" do
    it "tracks its subclasses in an Array" 

  end

  describe "#subclass_files" do
    it "returns tracked subclasses, grouped by the files they come from" 


    it "tracks a single subclass across multiple files" 

  end

  describe "#commands" do
    it "returns a list with all commands defined in this class" 


    it "raises an error if a command with reserved word is defined" 

  end

  describe "#all_commands" do
    it "returns a list with all commands defined in this class plus superclasses" 

  end

  describe "#remove_command" do
    it "removes the command from its commands hash" 


    it "undefines the method if desired" 

  end

  describe "#from_superclass" do
    it "does not send a method to the superclass if the superclass does not respond to it" 

  end

  describe "#start" do
    it "raises an error instead of rescuing if THOR_DEBUG=1 is given" 


    it "raises an error instead of rescuing if :debug option is given" 


    it "does not steal args" 


    it "checks unknown options" 


    it "checks unknown options except specified" 

  end

  describe "attr_*" do
    it "does not add attr_reader as a command" 


    it "does not add attr_writer as a command" 


    it "does not add attr_accessor as a command" 

  end
end

