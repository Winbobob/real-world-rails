require_relative 'helper'

describe "Pry::Command" do

  before do
    @set = Pry::CommandSet.new
    @set.import Pry::Commands
  end

  describe 'call_safely' do

    it 'should display a message if gems are missing' 


    it 'should abort early if arguments are required' 


    it 'should return VOID without keep_retval' 


    it 'should return the return value with keep_retval' 


    context "deprecated API" do
      it "should call hooks in the right order" 

    end

    context "hooks API" do
      before do
        @set.create_command 'jamaica', 'Out of Many, One People' do
          def process
            output.puts 1 + args[0].to_i
          end
        end
      end

      let(:hooks) {
        h = Pry::Hooks.new
        h.add_hook('before_jamaica', 'name1') do |i|
          output.puts 3 - i.to_i
        end

        h.add_hook('before_jamaica', 'name2') do |i|
          output.puts 4 - i.to_i
        end

        h.add_hook('after_jamaica', 'name3') do |i|
          output.puts 2 + i.to_i
        end

        h.add_hook('after_jamaica', 'name4') do |i|
          output.puts 3 + i.to_i
        end
      }

      it "should call hooks in the right order" 

    end

    # TODO: This strikes me as rather silly...
    it 'should return the value from the last hook with keep_retval' 

  end

  describe 'help' do
    it 'should default to the description for blocky commands' 


    it 'should use slop to generate the help for classy commands' 


    it 'should provide --help for classy commands' 


    it 'should provide a -h for classy commands' 


    it 'should use the banner provided' 

  end

  describe 'context' do
    let(:context) {
      {
        :target => binding,
        :output => StringIO.new,
        :eval_string => "eval-string",
        :command_set => @set,
        :pry_instance => Pry.new
      }
    }

    describe '#setup' do
      it 'should capture lots of stuff from the hash passed to new before setup' 

    end

    describe '#process' do
      it 'should capture lots of stuff from the hash passed to new before setup' 

    end
  end

  describe 'classy api' do

    it 'should call setup, then subcommands, then options, then process' 


    it 'should raise a command error if process is not overridden' 


    it 'should work if neither options, nor setup is overridden' 


    it 'should provide opts and args as provided by slop' 


    it 'should allow overriding options after definition' 


    it "should create subcommands" 


    it "should create subcommand options" 


    it "should accept top-level arguments" 


    describe "explicit classes" do
      before do
        @x = Class.new(Pry::ClassCommand) do
          options :baby => :pig
          match(/goat/)
          description "waaaninngggiiigygygygygy"
        end
      end

      it 'subclasses should inherit options, match and description from superclass' 

    end
  end

  describe 'tokenize' do
    it 'should interpolate string with #{} in them' 


    it 'should not fail if interpolation is not needed and target is not set' 


    it 'should not interpolate commands with :interpolate => false' 


    it 'should use shell-words to split strings' 


    it 'should split on spaces if shellwords is not used' 


    it 'should add captures to arguments for regex commands' 

  end

  describe 'process_line' do
    it 'should check for command name collisions if configured' 


    it 'should spot collision warnings on assignment if configured' 


    it "should set the commands' arg_string and captures" 


    it "should raise an error if the line doesn't match the command" 

   end

  describe "block parameters" do
    before do
      @context = Object.new
      @set.command "walking-spanish", "down the hall", :takes_block => true do
        insert_variable(:@x, command_block.call, target)
      end
      @set.import Pry::Commands

      @t = pry_tester(@context, :commands => @set)
    end

    it 'should accept multiline blocks' 


    it 'should accept normal parameters along with block' 


    describe "single line blocks" do
      it 'should accept blocks with do ; end' 


      it 'should accept blocks with do; end' 


      it 'should accept blocks with { }' 

    end

    describe "block-related content removed from arguments" do

      describe "arg_string" do
        it 'should remove block-related content from arg_string (with one normal arg)' 


        it 'should remove block-related content from arg_string (with no normal args)' 


        it 'should NOT remove block-related content from arg_string when :takes_block => false' 

      end

      describe "args" do
        describe "block_command" do
          it "should remove block-related content from arguments" 


          it "should NOT remove block-related content from arguments if :takes_block => false" 

        end

        describe "create_command" do
          it "should remove block-related content from arguments" 


          it "should NOT remove block-related content from arguments if :takes_block => false" 

        end
      end
    end

    describe "blocks can take parameters" do
      describe "{} style blocks" do
        it 'should accept multiple parameters' 

      end

      describe "do/end style blocks" do
        it 'should accept multiple parameters' 

      end
    end

    describe "closure behaviour" do
      it 'should close over locals in the definition context' 

    end

    describe "exposing block parameter" do
      describe "block_command" do
        it "should expose block in command_block method" 

      end

      describe "create_command" do
        it "should NOT expose &block in create_command's process method" 


        it "should expose block in command_block method" 

      end
    end
  end

  describe "a command made with a custom sub-class" do

    before do
      class MyTestCommand < Pry::ClassCommand
        match(/my-*test/)
        description 'So just how many sound technicians does it take to' \
          'change a lightbulb? 1? 2? 3? 1-2-3? Testing?'
        options :shellwords => false, :listing => 'my-test'

        undef process if method_defined? :process

        def process
          output.puts command_name * 2
        end
      end

      Pry.config.commands.add_command MyTestCommand
    end

    after do
      Pry.config.commands.delete 'my-test'
    end

    it "allows creation of custom subclasses of Pry::Command" 


    it "shows the source of the process method" 


    describe "command options hash" do
      it "is always present" 


      describe ":listing option" do
        it "defaults to :match if not set explicitly" 


        it "can be set explicitly" 


        it "equals to :match option's inspect, if :match is Regexp" 

      end
    end

  end

  describe "commands can save state" do
    before do
      @set = Pry::CommandSet.new do
        create_command "litella", "desc" do
          def process
            state.my_state ||= 0
            state.my_state += 1
          end
        end

        create_command "sanders", "desc" do
          def process
            state.my_state = "wood"
          end
        end

        create_command(/[Hh]ello-world/, "desc") do
          def process
            state.my_state ||= 0
            state.my_state += 2
          end
        end

      end.import Pry::Commands

      @t = pry_tester(:commands => @set)
    end

    it 'should save state for the command on the Pry#command_state hash' 


    it 'should ensure state is maintained between multiple invocations of command' 


    it 'should ensure state with same name stored seperately for each command' 


    it 'should ensure state is properly saved for regex commands' 

  end

  if defined?(Bond)
    describe 'complete' do
      it 'should return the arguments that are defined' 

    end
  end

  describe 'group' do
    before do
      @set.import(
                  Pry::CommandSet.new do
                    create_command("magic") { group("Not for a public use") }
                  end
                 )
    end

    it 'should be correct for default commands' 


    it 'should not change once it is initialized' 


    it 'should not disappear after the call without parameters' 

  end
end

