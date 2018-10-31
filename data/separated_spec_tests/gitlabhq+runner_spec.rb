# frozen_string_literal: true

describe QA::Specs::Runner do
  context '#perform' do
    before do
      allow(QA::Runtime::Browser).to receive(:configure!)
    end

    it 'excludes the orchestrated tag by default' 


    context 'when tty is set' do
      subject { described_class.new.tap { |runner| runner.tty = true } }

      it 'sets the `--tty` flag' 

    end

    context 'when tags are set' do
      subject { described_class.new.tap { |runner| runner.tags = %i[orchestrated github] } }

      it 'focuses on the given tags' 

    end

    context 'when "--tag smoke" is set as options' do
      subject { described_class.new.tap { |runner| runner.options = %w[--tag smoke] } }

      it 'focuses on the given tag without excluded the orchestrated tag' 

    end

    context 'when "qa/specs/features/foo" is set as options' do
      subject { described_class.new.tap { |runner| runner.options = %w[qa/specs/features/foo] } }

      it 'passes the given tests path and excludes the orchestrated tag' 

    end

    context 'when "-- qa/specs/features/foo" is set as options' do
      subject { described_class.new.tap { |runner| runner.options = %w[-- qa/specs/features/foo] } }

      it 'passes the given tests path and excludes the orchestrated tag' 

    end

    context 'when SIGNUP_DISABLED is true' do
      before do
        allow(QA::Runtime::Env).to receive(:signup_disabled?).and_return(true)
      end

      subject { described_class.new }

      it 'it includes default args and excludes the skip_signup_disabled tag' 

    end

    def expect_rspec_runner_arguments(arguments)
      expect(RSpec::Core::Runner).to receive(:run)
        .with(arguments, $stderr, $stdout)
        .and_return(0)
    end
  end
end

