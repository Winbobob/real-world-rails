module RSpec::Core
  RSpec.describe Reporter do
    include FormatterSupport

    let(:config)   { Configuration.new }
    let(:world)    { World.new(config) }
    let(:reporter) { Reporter.new config }
    let(:start_time) { Time.now }
    let(:example) { super() }

    describe "finish" do
      let(:formatter) { double("formatter") }

      %w[start_dump dump_pending dump_failures dump_summary close].map(&:to_sym).each do |message|
        it "sends #{message} to the formatter(s) that respond to message" 


        it "doesnt notify formatters about messages they dont implement" 

      end

      it "dumps the failure summary after the profile and deprecation summary so failures don't scroll off the screen and get missed" 


      it "allows the profiler to be used without being manually setup" 

    end

    describe 'start' do
      before { config.start_time = start_time }

      it 'notifies the formatter of start with example count' 


      it 'notifies the formatter of the seed used before notifing of start' 

    end

    context "given one formatter" do
      it "passes messages to that formatter" 


      it "passes messages to the formatter in the correct order" 

    end

    context "given an example group with no examples" do
      it "does not pass example_group_started or example_group_finished to formatter" 

    end

    context "given multiple formatters" do
      it "passes messages to all formatters" 

    end

    describe "#report" do
      it "supports one arg (count)" 


      it "yields itself" 

    end

    describe "#register_listener" do
      let(:listener) { double("listener", :start => nil) }

      before { reporter.register_listener listener, :start }

      it 'will register the listener to specified notifications' 


      it 'will match string notification names' 


      it 'will send notifications when a subscribed event is triggered' 


      it 'will ignore duplicated listeners' 

    end

    describe "#publish" do
      let(:listener) { double("listener", :custom => nil) }
      before do
        reporter.register_listener listener, :custom, :start
      end

      it 'will send custom events to registered listeners' 


      it 'will raise when encountering RSpec standard events' 


      it 'will ignore event names sent as strings' 


      it 'will provide a custom notification object based on the options hash' 

    end

    describe "#abort_with" do
      before { allow(reporter).to receive(:exit!) }

      it "publishes the message and notifies :close" 


      it "exits with the provided exit code" 

    end

    describe "timing" do
      before do
        config.start_time = start_time
      end

      it "uses RSpec::Core::Time as to not be affected by changes to time in examples" 


      it "captures the load time so it can report it later" 

    end

    describe "#notify_non_example_exception" do
      it "sends a `message` notification that contains the formatted exception details" 


      it "records the fact that a non example failure has occurred" 

    end
  end
end

