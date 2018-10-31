require 'rspec/core/drb'

RSpec.describe RSpec::Core::DRbRunner, :isolated_directory => true, :isolated_home => true, :type => :drb, :unless => RUBY_PLATFORM == 'java' do
  let(:config) { RSpec::Core::Configuration.new }
  let(:out)    { StringIO.new }
  let(:err)    { StringIO.new }

  include_context "spec files"

  def runner(*args)
    RSpec::Core::DRbRunner.new(config_options(*args))
  end

  def config_options(*args)
    RSpec::Core::ConfigurationOptions.new(args)
  end

  context "without server running" do
    it "raises an error" 


    after { DRb.stop_service }
  end

  describe "--drb-port" do
    def with_RSPEC_DRB_set_to(val)
      with_env_vars('RSPEC_DRB' => val) { yield }
    end

    context "without RSPEC_DRB environment variable set" do
      it "defaults to 8989" 


      it "sets the DRb port" 

    end

    context "with RSPEC_DRB environment variable set" do
      context "without config variable set" do
        it "uses RSPEC_DRB value" 

      end

      context "and config variable set" do
        it "uses configured value" 

      end
    end
  end

  context "with server running", :slow do
    class SimpleDRbSpecServer
      def self.run(argv, err, out)
        options = RSpec::Core::ConfigurationOptions.new(argv)
        config  = RSpec::Core::Configuration.new
        RSpec.configuration = config
        RSpec::Core::Runner.new(options, config).run(err, out)
      end
    end

    before(:all) do
      @drb_port = '8990'
      DRb::start_service("druby://127.0.0.1:#{@drb_port}", SimpleDRbSpecServer)
    end

    after(:all) do
      DRb::stop_service
    end

    it "falls back to `druby://:0` when `druby://localhost:0` fails" 


    it "returns 0 if spec passes" 


    it "returns 1 if spec fails" 


    it "outputs colorized text when running with --force-color option" 

  end
end

RSpec.describe RSpec::Core::DRbOptions, :isolated_directory => true, :isolated_home => true do
  include ConfigOptionsHelper

  describe "DRB args" do
    def drb_argv_for(args)
      options = config_options_object(*args)
      RSpec::Core::DRbRunner.new(options, RSpec.configuration).drb_argv
    end

    def drb_filter_manager_for(args)
      configuration = RSpec::Core::Configuration.new
      RSpec::Core::DRbRunner.new(config_options_object(*args), configuration).drb_argv
      configuration.filter_manager
    end

    it "preserves extra arguments" 


    %w(--color --force-color --no-color --fail-fast --profile --backtrace --tty).each do |option|
      it "includes #{option}" 

    end

    it "includes --failure-exit-code" 


    it "includes --options" 


    it "includes --order" 


    context "with --example" do
      it "includes --example" 


      it "unescapes characters which were escaped upon storing --example originally" 

    end

    context "with tags" do
      it "includes the inclusion tags" 


      it "includes the inclusion tags with values" 


      it "leaves inclusion tags intact" 


      it "leaves inclusion tags with values intact" 


      it "includes the exclusion tags" 


      it "includes the exclusion tags with values" 


      it "leaves exclusion tags intact" 


      it "leaves exclusion tags with values intact" 

    end

    context "with formatters" do
      it "includes the formatters" 


      it "leaves formatters intact" 


      it "leaves output intact" 

    end

    context "with --out" do
      it "combines with formatters" 

    end

    context "with -I libs" do
      it "includes -I" 


      it "includes multiple paths" 

    end

    context "with --require" do
      it "includes --require" 


      it "includes multiple paths" 

    end

    context "--drb specified in ARGV" do
      it "renders all the original arguments except --drb" 

    end

    context "--drb specified in the options file" do
      it "renders all the original arguments except --drb" 

    end

    context "--drb specified in ARGV and the options file" do
      it "renders all the original arguments except --drb" 

    end

    context "--drb specified in ARGV and in as ARGV-specified --options file" do
      it "renders all the original arguments except --drb and --options" 

    end

    describe "--drb, -X" do
      it "does not send --drb back to the parser after parsing options" 

    end
  end
end

