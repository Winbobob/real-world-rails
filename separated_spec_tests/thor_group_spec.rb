require "helper"

describe Thor::Group do
  describe "command" do
    it "allows to use private methods from parent class as commands" 

  end

  describe "#start" do
    it "invokes all the commands under the Thor group" 


    it "uses argument's default value" 


    it "invokes all the commands in the Thor group and its parents" 


    it "raises an error if a required argument is added after a non-required" 


    it "raises when an exception happens within the command call" 


    it "raises an error when a Thor group command expects arguments" 


    it "invokes help message if any of the shortcuts are given" 

  end

  describe "#desc" do
    it "sets the description for a given class" 


    it "can be inherited" 


    it "can be nil" 

  end

  describe "#help" do
    before do
      @content = capture(:stdout) { MyCounter.help(Thor::Base.shell.new) }
    end

    it "provides usage information" 


    it "shows description" 


    it "shows options information" 

  end

  describe "#invoke" do
    before do
      @content = capture(:stdout) { E.start }
    end

    it "allows to invoke a class from the class binding" 


    it "shows invocation information to the user" 


    it "uses padding on status generated by the invoked class" 


    it "allows invocation to be configured with blocks" 


    it "shows invoked options on help" 

  end

  describe "#invoke_from_option" do
    describe "with default type" do
      before do
        @content = capture(:stdout) { G.start }
      end

      it "allows to invoke a class from the class binding by a default option" 


      it "does not invoke if the option is nil" 


      it "prints a message if invocation cannot be found" 


      it "allows to invoke a class from the class binding by the given option" 


      it "shows invocation information to the user" 


      it "uses padding on status generated by the invoked class" 


      it "shows invoked options on help" 

    end

    describe "with boolean type" do
      before do
        @content = capture(:stdout) { H.start }
      end

      it "allows to invoke a class from the class binding by a default option" 


      it "does not invoke if the option is false" 


      it "shows invocation information to the user" 


      it "uses padding on status generated by the invoked class" 


      it "shows invoked options on help" 

    end
  end

  describe "edge-cases" do
    it "can handle boolean options followed by arguments" 


    it "provides extra args as `args`" 

  end
end
