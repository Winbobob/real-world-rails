require 'pathname'

module RSpec::Core::Formatters
  RSpec.describe Loader do

    let(:output)   { StringIO.new }
    let(:reporter) { instance_double "Reporter", :register_listener => nil }
    let(:loader)   { Loader.new reporter }

    describe "#add(formatter)" do
      let(:path) { File.join(Dir.tmpdir, 'output.txt') }

      it "adds to the list of formatters" 


      it "finds a formatter by name (w/ Symbol)" 


      it "finds a formatter by name (w/ String)" 


      it "finds a formatter by class" 


      it "finds a formatter by class name" 


      it "lets you pass a formatter instance, for when you need to instantiate it with some custom state" 


      context "when a legacy formatter is added with RSpec::LegacyFormatters" do
        formatter_class = Struct.new(:output)
        let(:formatter) { double "formatter", :notifications => notifications, :output => output }
        let(:notifications) { [:a, :b, :c] }

        before do
          class_double("RSpec::LegacyFormatters", :load_formatter => formatter).as_stubbed_const
        end

        it "loads formatters from the external gem" 


        it "subscribes the formatter to the notifications the adaptor implements" 


        it "will ignore duplicate legacy formatters" 

      end

      context "when a legacy formatter is added without RSpec::LegacyFormatters" do
        formatter_class = Struct.new(:output)

        before do
          allow_deprecation
        end

        it "issues a deprecation" 

      end

      it "finds a formatter by class fully qualified name" 


      it "requires a formatter file based on its fully qualified name" 


      it "raises NameError if class is unresolvable" 


      it "raises ArgumentError if formatter is unknown" 


      context "with a 2nd arg defining the output" do
        it "creates a file at that path and sets it as the output" 


        it "accepts Pathname objects for file paths" 

      end

      context "when a duplicate formatter exists" do
        before { loader.add :documentation, output }

        it "doesn't add the formatter for the same output target" 


        it "adds the formatter for different output targets" 

      end

      context "When a custom formatter exists" do
        specific_formatter = RSpec::Core::Formatters::JsonFormatter
        generic_formatter = specific_formatter.superclass

        before { loader.add generic_formatter, output }

        it "adds a subclass of that formatter for the same output target" 

      end
    end

    describe "#setup_default" do
      let(:setup_default) { loader.setup_default output, output }

      context "with a formatter that implements #message" do
        it 'doesnt add a fallback formatter' 

      end

      context "without a formatter that implements #message" do
        it 'adds a fallback for message output' 

      end

      context "with profiling enabled" do
        before do
          allow(reporter).to receive(:registered_listeners).with(:message) { [:json] }
          allow(RSpec.configuration).to receive(:profile_examples?) { true }
        end

        context "without an existing profile formatter" do
          it "will add the profile formatter" 

        end

        context "when a formatter that implement #dump_profile is added" do
          it "wont add the profile formatter" 

        end
      end
    end
  end
end

