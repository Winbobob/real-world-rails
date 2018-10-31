# frozen_string_literal: true

require 'fuubar'
require 'stringio'
require 'ostruct'

# rubocop:disable Metrics/LineLength
describe Fuubar do
  let(:output) do
    io = StringIO.new

    allow(io).to receive(:tty?)
                   .and_return(true)

    io
  end

  let(:formatter)            { Fuubar.new(output) }
  let(:example)              { self.class.example }
  let(:example_count)        { 2 }
  let(:start_notification)   { RSpec::Core::Notifications::StartNotification.new(example_count, Time.now) }
  let(:message_notification) { RSpec::Core::Notifications::MessageNotification.new('My Message') }
  let(:example_notification) { RSpec::Core::Notifications::ExampleNotification.for(example) }
  let(:pending_notification) { RSpec::Core::Notifications::ExampleNotification.for(pending_example) }
  let(:failed_notification)  { RSpec::Core::Notifications::ExampleNotification.for(failed_example) }

  let(:failed_example) do
    exception = RuntimeError.new('Test Fuubar Error')
    exception.set_backtrace [
                              "/my/filename.rb:4:in `some_method'",
                            ]

    example = self.class.example

    example.metadata[:file_path] = '/my/example/spec.rb'
    example.metadata[:execution_result].status = :failed
    example.metadata[:execution_result].exception = exception

    example
  end

  let(:pending_example) do
    example = self.class.example
    example.metadata[:execution_result].pending_fixed = true
    example
  end

  let(:fuubar_results) do
    output.rewind
    output.read
  end

  before(:each) do
    RSpec.configuration.fuubar_progress_bar_options = {
      :length        => 40,
      :throttle_rate => 0.0,
    }

    ENV.delete('CONTINUOUS_INTEGRATION')
  end

  context 'when it is created' do
    it 'does not start the bar until the formatter is started' 


    it 'creates a new ProgressBar' 


    it 'sets the format of the bar to the default' 


    it 'sets the total to the number of examples' 


    it 'sets the bar\'s output' 


    context 'and continuous integration is enabled' do
      before do
        RSpec.configuration.fuubar_progress_bar_options = { :length => 40 }
        ENV['CONTINUOUS_INTEGRATION'] = 'true'
      end

      it 'throttles the progress bar at one second' 


      context 'when processing an example' do
        before do
          formatter.start(start_notification)

          throttle       = formatter.progress.__send__(:output).__send__(:throttle)
          _throttle_rate = throttle.__send__(:rate=, 0.0)

          output.rewind

          formatter.example_passed(example)
        end

        it 'does not output color codes' 

      end
    end

    context 'and continuous integration is not enabled' do
      before do
        RSpec.configuration.fuubar_progress_bar_options = { :length => 40 }
        ENV['CONTINUOUS_INTEGRATION'] = 'false'
      end

      it 'throttles the progress bar at the default rate' 


      context 'when processing an example' do
        before do
          formatter.start(start_notification)

          throttle       = formatter.progress.__send__(:output).__send__(:throttle)
          _throttle_rate = throttle.__send__(:rate=, 0.0)

          output.rewind

          formatter.example_passed(example)
        end

        it 'does not output color codes' 

      end
    end
  end

  context 'when custom options are set after the formatter is created' do
    before(:each) do
      formatter
      RSpec.configuration.fuubar_progress_bar_options = {
        :length        => 40,
        :throttle_rate => 0.0,
        :format        => '%c',
      }
    end

    context 'when the bar is started' do
      before(:each) { formatter.start(start_notification) }

      it 'properly creates the bar' 

    end
  end

  context 'when it is started' do
    before { formatter.start(start_notification) }

    it 'sets the total to the number of examples' 


    context 'and no custom options are passed in' do
      it 'sets the format of the bar to the default' 

    end

    context 'and an example passes' do
      before do
        output.rewind

        formatter.example_passed(example)
      end

      it 'outputs the proper bar information' 

    end

    context 'and an example pends' do
      before do
        output.rewind

        formatter.example_pending(pending_example)
      end

      it 'outputs the proper bar information' 


      context 'and then an example succeeds' do
        before do
          output.rewind

          formatter.example_pending(pending_notification)
        end

        it 'outputs the pending bar' 

      end
    end

    context 'and an example fails' do
      it 'outputs the proper bar information' 


      context 'and then an example succeeds' do
        before do
          formatter.example_failed(failed_notification)

          output.rewind

          formatter.example_passed(example)
        end

        it 'outputs the failed bar' 

      end

      context 'and then an example pends' do
        before do
          formatter.example_failed(failed_notification)

          output.rewind

          formatter.example_pending(example_notification)
        end

        it 'outputs the failed bar' 

      end
    end

    it 'can properly log messages' 

  end
end
# rubocop:enable Metrics/LineLength

