require "helper"
require "thor/base"

describe Thor::Invocation do
  describe "#invoke" do
    it "invokes a command inside another command" 


    it "invokes a command just once" 


    it "invokes a command just once even if they belongs to different classes" 


    it "invokes a command with arguments" 


    it "invokes the default command if none is given to a Thor class" 


    it "accepts a class as argument without a command to invoke" 


    it "accepts a class as argument with a command to invoke" 


    it "allows customized options to be given" 


    it "reparses options in the new class" 


    it "shares initialize options with invoked class" 


    it "uses default options from invoked class if no matching arguments are given" 


    it "overrides default options if options are passed to the invoker" 


    it "returns the command chain" 


    it "dump configuration values to be used in the invoked class" 


    it "allow extra configuration values to be given" 


    it "invokes a Thor::Group and all of its commands" 


    it "does not invoke a Thor::Group twice" 


    it "does not invoke any of Thor::Group commands twice" 


    it "raises Thor::UndefinedCommandError if the command can't be found" 


    it "raises Thor::UndefinedCommandError if the command can't be found even if all commands were already executed" 


    it "raises an error if a non Thor class is given" 

  end
end

