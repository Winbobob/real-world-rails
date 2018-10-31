require "helper"

describe Thor do
  describe "#method_option" do
    it "sets options to the next method to be invoked" 


    describe ":lazy_default" do
      it "is absent when option is not specified" 


      it "sets a default that can be overridden for strings" 


      it "sets a default that can be overridden for numerics" 


      it "sets a default that can be overridden for arrays" 


      it "sets a default that can be overridden for hashes" 

    end

    describe "when :for is supplied" do
      it "updates an already defined command" 


      describe "and the target is on the parent class" do
        it "updates an already defined command" 


        it "adds a command to the command list if the updated command is on the parent class" 


        it "clones the parent command" 

      end
    end
  end

  describe "#default_command" do
    it "sets a default command" 


    it "invokes the default command if no command is specified" 


    it "invokes the default command if no command is specified even if switches are given" 


    it "inherits the default command from parent" 

  end

  describe "#stop_on_unknown_option!" do
    my_script = Class.new(Thor) do
      class_option "verbose",   :type => :boolean
      class_option "mode",      :type => :string

      stop_on_unknown_option! :exec

      desc "exec", "Run a command"
      def exec(*args)
        [options, args]
      end

      desc "boring", "An ordinary command"
      def boring(*args)
        [options, args]
      end
    end

    it "passes remaining args to command when it encounters a non-option" 


    it "passes remaining args to command when it encounters an unknown option" 


    it "still accepts options that are given before non-options" 


    it "still accepts options that require a value" 


    it "still passes everything after -- to command" 


    it "does not affect ordinary commands" 


    context "when provided with multiple command names" do
      klass = Class.new(Thor) do
        stop_on_unknown_option! :foo, :bar
      end
      it "affects all specified commands" 

    end

    context "when invoked several times" do
      klass = Class.new(Thor) do
        stop_on_unknown_option! :foo
        stop_on_unknown_option! :bar
      end
      it "affects all specified commands" 

    end

    it "doesn't break new" 

  end

  describe "#disable_required_check!" do
    my_script = Class.new(Thor) do
      class_option "foo", :required => true

      disable_required_check! :boring

      desc "exec", "Run a command"
      def exec(*args)
        [options, args]
      end

      desc "boring", "An ordinary command"
      def boring(*args)
        [options, args]
      end
    end

    it "does not check the required option in the given command" 


    it "does check the required option of the remaining command" 


    it "does affects help by default" 


    context "when provided with multiple command names" do
      klass = Class.new(Thor) do
        disable_required_check! :foo, :bar
      end

      it "affects all specified commands" 

    end

    context "when invoked several times" do
      klass = Class.new(Thor) do
        disable_required_check! :foo
        disable_required_check! :bar
      end

      it "affects all specified commands" 

    end
  end

  describe "#map" do
    it "calls the alias of a method if one is provided" 


    it "calls the alias of a method if several are provided via #map" 


    it "inherits all mappings from parent" 

  end

  describe "#package_name" do
    it "provides a proper description for a command when the package_name is assigned" 


    # TODO: remove this, might be redundant, just wanted to prove full coverage
    it "provides a proper description for a command when the package_name is NOT assigned" 

  end

  describe "#desc" do
    it "provides description for a command" 


    it "provides no namespace if $thor_runner is false" 


    describe "when :for is supplied" do
      it "overwrites a previous defined command" 

    end

    describe "when :hide is supplied" do
      it "does not show the command in help" 


      it "but the command is still invokable, does not show the command in help" 

    end
  end

  describe "#method_options" do
    it "sets default options if called before an initializer" 


    it "overwrites default options if called on the method scope" 


    it "allows default options to be merged with method options" 

  end

  describe "#start" do
    it "calls a no-param method when no params are passed" 


    it "calls a single-param method when a single param is passed" 


    it "does not set options in attributes" 


    it "raises an error if the wrong number of params are provided" 


    it "raises an error if the invoked command does not exist" 


    it "calls method_missing if an unknown method is passed in" 


    it "does not call a private method no matter what" 


    it "uses command default options" 


    it "raises when an exception happens within the command call" 


    context "when the user enters an unambiguous substring of a command" do
      it "invokes a command" 


      it "invokes a command, even when there's an alias it resolves to the same command" 


      it "invokes an alias" 

    end

    context "when the user enters an ambiguous substring of a command" do
      it "raises an exception and displays a message that explains the ambiguity" 


      it "raises an exception when there is an alias" 

    end
  end

  describe "#help" do
    def shell
      @shell ||= Thor::Base.shell.new
    end

    describe "on general" do
      before do
        @content = capture(:stdout) { MyScript.help(shell) }
      end

      it "provides useful help info for the help method itself" 


      it "provides useful help info for a method with params" 


      it "uses the maximum terminal size to show commands" 


      it "provides description for commands from classes in the same namespace" 


      it "shows superclass commands" 


      it "shows class options information" 


      it "injects class arguments into default usage" 

    end

    describe "for a specific command" do
      it "provides full help info when talking about a specific command" 


      it "raises an error if the command can't be found" 


      it "normalizes names before claiming they don't exist" 


      it "uses the long description if it exists" 


      it "doesn't assign the long description to the next command without one" 

    end

    describe "instance method" do
      it "calls the class method" 


      it "calls the class method" 

    end

    context "with required class_options" do
      let(:klass) do
        Class.new(Thor) do
          class_option :foo, :required => true

          desc "bar", "do something"
          def bar; end
        end
      end

      it "shows the command help" 

    end
  end

  describe "subcommands" do
    it "triggers a subcommand help when passed --help" 

  end

  describe "when creating commands" do
    it "prints a warning if a public method is created without description or usage" 


    it "does not print if overwriting a previous command" 

  end

  describe "edge-cases" do
    it "can handle boolean options followed by arguments" 


    it "passes through unknown options" 


    it "does not pass through unknown options with strict args" 


    it "strict args works in the inheritance chain" 


    it "does not check the default type when check_default_type! is not called" 


    it "checks the default type when check_default_type! is called" 


    it "send as a command name" 

  end
end

