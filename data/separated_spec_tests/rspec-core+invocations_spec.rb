require 'rspec/core/drb'
require 'rspec/core/bisect/coordinator'
require 'rspec/core/project_initializer'

module RSpec::Core
  RSpec.describe Invocations do
    let(:configuration_options) { instance_double(ConfigurationOptions) }
    let(:err) { StringIO.new }
    let(:out) { StringIO.new }

    def run_invocation
      subject.call(configuration_options, err, out)
    end

    describe Invocations::InitializeProject do
      it "initializes a project and returns a 0 exit code" 

    end

    describe Invocations::DRbWithFallback do
      context 'when a DRb server is running' do
        it "builds a DRbRunner and runs the specs" 

      end

      context 'when a DRb server is not running' do
        let(:runner) { instance_double(RSpec::Core::Runner, :run => 0) }

        before(:each) do
          allow(RSpec::Core::Runner).to receive(:new).and_return(runner)
          allow(RSpec::Core::DRbRunner).to receive(:new).and_raise(DRb::DRbConnError)
        end

        it "outputs a message" 


        it "builds a runner instance and runs the specs" 


        if RSpec::Support::RubyFeatures.supports_exception_cause?
          it "prevents the DRb error from being listed as the cause of expectation failures" 

        end
      end
    end

    describe Invocations::Bisect do
      let(:original_cli_args) { %w[--bisect --seed 1234] }
      let(:configuration_options) { ConfigurationOptions.new(original_cli_args) }
      let(:success) { true }

      before do
        allow(RSpec::Core::Bisect::Coordinator).to receive(:bisect_with).and_return(success)
      end

      it "starts the bisection coordinator" 


      context "when the bisection is successful" do
        it "returns 0" 

      end

      context "when the bisection is unsuccessful" do
        let(:success) { false }

        it "returns 1" 

      end

      context "and the verbose option is specified" do
        let(:original_cli_args) { %w[--bisect=verbose --seed 1234] }

        it "starts the bisection coordinator with the debug formatter" 

      end
    end

    describe Invocations::PrintVersion do
      before do
        allow(subject).to receive(:require).and_call_original
        allow(subject).to receive(:require).with("rspec/rails/version").and_raise(LoadError)
      end

      it "prints the major.minor version of RSpec as a whole" 


      it "prints off the whole version if it's a pre-release" 


      it "prints off the version of each part of RSpec" 


      it "indicates a part is not installed if it cannot be loaded" 


      it "returns a zero exit code" 

    end

    describe Invocations::PrintHelp do
      let(:parser) { instance_double(OptionParser) }
      let(:invalid_options) { %w[ -d ] }

      subject { described_class.new(parser, invalid_options) }

      before do
        allow(parser).to receive(:to_s).and_return(<<-EOS)
        -d
        --bisect[=verbose]           Repeatedly runs the suite in order...
        EOS
      end

      it "prints the CLI options and returns a zero exit code" 


      it "won't display invalid options in the help output" 

    end
  end
end

