require 'rspec/core/drb'
require 'support/runner_support'

module RSpec::Core
  RSpec.describe Runner do
    describe 'invocation' do
      before do
        # Simulate invoking the suite like exe/rspec does.
        allow(RSpec::Core::Runner).to receive(:run)
        RSpec::Core::Runner.invoke
      end

      it 'does not autorun after having been invoked' 


      it 'prints a warning when autorun is attempted' 

    end

    describe '.autorun' do
      before do
        @original_ivars = Hash[ Runner.instance_variables.map do |ivar|
          [ivar, Runner.instance_variable_get(ivar)]
        end ]
      end

      after do
        (@original_ivars.keys | Runner.instance_variables).each do |ivar|
          if @original_ivars.key?(ivar)
            Runner.instance_variable_set(ivar, @original_ivars[ivar])
          else
            # send is necessary for 1.8.7
            Runner.send(:remove_instance_variable, ivar)
          end
        end
      end

      it 'sets an at_exit hook if none is already set' 


      it 'does not set the at_exit hook if it is already set' 

    end

    describe "at_exit hook" do
      before { allow(Runner).to receive(:invoke) }

      it 'normally runs the spec suite' 


      it 'does not run the suite if an error triggered the exit' 


      it 'stil runs the suite if a `SystemExit` occurs since that is caused by `Kernel#exit`' 

    end

    describe "interrupt handling" do
      before { allow(Runner).to receive(:exit!) }

      it 'prints a message the first time, then exits the second time' 

    end

    describe "interrupt catching" do
      let(:interrupt_handlers) { [] }

      before do
        allow(Runner).to receive(:trap).with("INT", any_args) do |&block|
          interrupt_handlers << block
        end
      end

      def interrupt
        interrupt_handlers.each(&:call)
      end

      it "adds a handler for SIGINT" 


      context "with SIGINT once" do
        it "aborts processing" 


        it "does not exit immediately, but notifies the user" 

      end

      context "with SIGINT twice" do
        it "exits immediately" 

      end
    end

    # This is intermittently slow because this method calls out to the network
    # interface.
    describe ".running_in_drb?", :slow do
      subject { RSpec::Core::Runner.running_in_drb? }

      before do
        allow(::DRb).to receive(:current_server) { drb_server }

        # To deal with some network weirdness at my workplace, I had to
        # configure my network adapter in a non-standard way that causes
        # `IPSocket.getaddress(Socket.gethostname)` to raise
        # `SocketError: getaddrinfo: nodename nor servname provided, or not known`
        # I'm not sure why this happens, but to keep the specs here passing,
        # I have to stub this out :(.
        allow(IPSocket).to receive(:getaddress) { "127.0.0.1" }
      end

      context "when drb server is started with 127.0.0.1" do
        let(:drb_server) do
          instance_double(::DRb::DRbServer, :uri => "druby://127.0.0.1:0000/", :alive? => true)
        end

        it { should be_truthy }
      end

      context "when drb server is started with localhost" do
        let(:drb_server) do
          instance_double(::DRb::DRbServer, :uri => "druby://localhost:0000/", :alive? => true)
        end

        it { should be_truthy }
      end

      context "when drb server is started with another local ip address" do
        let(:drb_server) do
          instance_double(::DRb::DRbServer, :uri => "druby://192.168.0.1:0000/", :alive? => true)
        end

        before do
          allow(::IPSocket).to receive(:getaddress).and_return("192.168.0.1")
        end

        it { should be_truthy }
      end

      context "when drb server is started with 127.0.0.1 but not alive" do
        let(:drb_server) do
          instance_double(::DRb::DRbServer, :uri => "druby://127.0.0.1:0000/", :alive? => false)
        end

        it { should be_falsey }
      end

      context "when IPSocket cannot resolve the current hostname" do
        let(:drb_server) do
          instance_double(::DRb::DRbServer, :uri => "druby://localhost:0000/", :alive? => true)
        end

        before do
          allow(::IPSocket).to receive(:getaddress).and_raise(
            SocketError, "getaddrinfo: nodename nor servname provided, or not known"
          )
        end

        it { should be_falsey }
      end

      context "when no drb server is running" do
        let(:drb_server) do
          raise ::DRb::DRbServerNotFound
        end

        it { should be_falsey }
      end
    end

    describe ".invoke" do
      let(:runner) { RSpec::Core::Runner }

      it "runs the specs via #run" 


      it "doesn't exit on success" 


      it "exits with #run's status on failure" 

    end

    describe ".run" do
      let(:args) { double(:args) }
      let(:err) { StringIO.new }
      let(:out) { StringIO.new }
      let(:options) { { } }
      let(:configuration_options) { double(:configuration_options, :options => options) }

      before(:each) do
        allow(RSpec::Core::ConfigurationOptions).to receive(:new).and_return(configuration_options)
      end

      context 'when the options contain a runner callable' do
        let(:runner) { double(:runner, :call => nil) }
        let(:options) { { :runner => runner } }

        it 'invokes the runner callable' 

      end

      context 'when no runner callable is set' do
        it 'instantiates a Runner instance and runs it' 

      end

    end

    context "when run" do
      include_context "Runner support"

      before do
        allow(config.hooks).to receive(:run)
      end

      it "configures streams before command line options" 


      it "assigns submitted ConfigurationOptions to @options" 


      describe "#run" do
        it 'supports a test-queue like subclass that can perform setup once and run different sets of example groups multiple times' 


        it 'reports the expected example count accurately, even when subclasses filter example groups' 


        describe "persistence of example statuses" do
          let(:all_examples) { [double("example")] }

          def run
            allow(world).to receive(:all_examples).and_return(all_examples)
            allow(config).to receive(:load_spec_files)

            class_spy(ExampleStatusPersister, :load_from => []).as_stubbed_const

            runner = build_runner
            runner.run(err, out)
          end

          context "when `example_status_persistence_file_path` is configured" do
            it 'persists the status of all loaded examples' 

          end

          context "with --dry-run" do
            it "doesn't persist example status" 

          end

          context "when `example_status_persistence_file_path` is not configured" do
            it "doesn't persist example status" 

          end
        end

        context "running files" do
          include_context "spec files"

          it "returns 0 if spec passes" 


          it "returns 1 if spec fails" 


          it "returns 2 if spec fails and --failure-exit-code is 2" 

        end
      end

      describe "#run with custom output" do
        before { allow(config).to receive_messages :files_to_run => [] }

        let(:output_file) { File.new("#{Dir.tmpdir}/runner_spec_output.txt", 'w') }

        it "doesn't override output_stream" 

      end
    end
  end
end

