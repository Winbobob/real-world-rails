require 'listen/event/processor'
require 'listen/event/config'

RSpec.describe Listen::Event::Processor do
  let(:event_queue) { instance_double(::Queue, 'event_queue') }
  let(:config) { instance_double(Listen::Event::Config) }
  let(:reasons) { instance_double(::Queue, 'reasons') }

  subject { described_class.new(config, reasons) }

  # This is to simulate events over various points in time
  let(:sequence) do
    {}
  end

  let(:state) do
    { time: 0 }
  end

  def status_for_time(time)
    # find the status of the listener for a given point in time
    previous_state_timestamps = sequence.keys.reject { |k| k > time }
    last_state_before_given_time = previous_state_timestamps.max
    sequence[last_state_before_given_time]
  end

  before do
    allow(config).to receive(:event_queue).and_return(event_queue)

    allow(config).to receive(:stopped?) do
      status_for_time(state[:time]) == :stopped
    end

    allow(config).to receive(:paused?) do
      status_for_time(state[:time]) == :paused
    end

    allow(config).to receive(:timestamp) do
      state[:time]
    end
  end

  describe '#loop_for' do
    before do
      allow(reasons).to receive(:empty?).and_return(true)
    end

    context 'when stopped' do
      before do
        sequence[0.0] = :stopped
      end

      context 'with pending changes' do
        before do
          allow(event_queue).to receive(:empty?).and_return(false)
        end

        it 'does not change the event queue' 


        it 'does not sleep' 

      end
    end

    context 'when not stopped' do
      before do
        allow(event_queue).to receive(:empty?).and_return(true)
      end

      context 'when initially paused' do
        before do
          sequence[0.0] = :paused
        end

        context 'when stopped after sleeping' do
          before do
            sequence[0.2] = :stopped
          end

          it 'sleeps, waiting to be woken up' 


          it 'breaks' 

        end

        context 'when still paused after sleeping' do
          context 'when there were no events before' do
            before do
              sequence[1.0] = :stopped
            end

            it 'sleeps for latency to possibly later optimize some events' 

          end

          context 'when there were no events for ages' do
            before do
              sequence[3.5] = :stopped # in the future to break from the loop
            end

            it 'still does not process events because it is paused' 

          end
        end
      end

      context 'when initially processing' do
        before do
          sequence[0.0] = :processing
        end

        context 'when event queue is empty' do
          before do
            allow(event_queue).to receive(:empty?).and_return(true)
          end

          context 'when stopped after sleeping' do
            before do
              sequence[0.2] = :stopped
            end

            it 'sleeps, waiting to be woken up' 


            it 'breaks' 

          end
        end

        context 'when event queue has events' do
          before do
          end

          context 'when there were events ages ago' do
            before do
              sequence[3.5] = :stopped # in the future to break from the loop
            end

            it 'processes events' 

          end

          #  context "when stopped after sleeping" do
          #    it "breaks from the loop" do
          #      pending "todo"
          #    end
          #  end
        end
      end
    end
  end
end

