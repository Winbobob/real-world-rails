require "helper"

describe Thor do
  describe "#subcommand" do
    it "maps a given subcommand to another Thor subclass" 


    it "passes commands to subcommand classes" 


    it "passes arguments to subcommand classes" 


    it "ignores unknown options (the subcommand class will handle them)" 


    it "passes parsed options to subcommands" 


    it "accepts the help switch and calls the help command on the subcommand" 


    it "accepts the help short switch and calls the help command on the subcommand" 


    it "the help command on the subcommand and after it should result in the same output" 

  end

  context "subcommand with an arg" do
    module SubcommandTest1
      class Child1 < Thor
        desc "foo NAME", "Fooo"
        def foo(name)
          puts "#{name} was given"
        end
      end

      class Parent < Thor
        desc "child1", "child1 description"
        subcommand "child1", Child1
      end
    end

    it "shows subcommand name and method name" 

  end
end

