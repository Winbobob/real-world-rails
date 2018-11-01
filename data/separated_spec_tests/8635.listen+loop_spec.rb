require 'thread'
require 'listen/event/config'
require 'listen/event/loop'
require 'listen/internals/thread_pool'

RSpec.describe Listen::Event::Loop do
  let(:config) { instance_double(Listen::Event::Config, 'config') }
  let(:processor) { instance_double(Listen::Event::Processor, 'processor') }
  let(:thread) { instance_double(Thread) }

  let(:reasons) { instance_double(::Queue, 'reasons') }
  let(:ready) { instance_double(::Queue, 'ready') }

  let(:blocks) do
    {
      thread_block: proc { fail 'thread block stub called' },
      timer_block: proc { fail 'thread block stub called' }
    }
  end

  subject { described_class.new(config) }

  # TODO: this is hideous
  before do
    allow(::Queue).to receive(:new).and_return(reasons, ready)
    allow(Listen::Event::Processor).to receive(:new).with(config, reasons).
      and_return(processor)

    allow(Listen::Internals::ThreadPool).to receive(:add) do |*args, &block|
      fail 'Unstubbed call:'\
        " ThreadPool.add(#{args.map(&:inspect) * ','},&#{block.inspect})"
    end

    allow(config).to receive(:min_delay_between_events).and_return(1.234)

    allow(Listen::Internals::ThreadPool).to receive(:add) do |*_, &block|
      blocks[:thread_block] = block
      thread
    end

    allow(Timeout).to receive(:timeout) do |*_args, &block|
      blocks[:timer_block] = block
    end

    allow(Kernel).to receive(:sleep) do |*args|
      fail "stub called: sleep(#{args.map(&:inspect) * ','})"
    end

    allow(subject).to receive(:_nice_error) do |ex|
      indent = "\n -- "
      backtrace = ex.backtrace.reject { |line| line =~ %r{\/gems\/} }
      fail "error called: #{ex}: #{indent}#{backtrace * indent}"
    end
  end

  describe '#setup' do
    before do
      allow(thread).to receive(:wakeup)
      allow(thread).to receive(:alive?).and_return(true)
      allow(config).to receive(:min_delay_between_events).and_return(1.234)
      allow(ready).to receive(:<<).with(:ready)
    end

    it 'sets up the thread in a resumable state' 

  end

  context 'when stopped' do
    context 'when resume is called' do
      it 'fails' 

    end

    context 'when wakeup_on_event is called' do
      it 'does nothing' 

    end
  end

  context 'when resumed' do
    before do
      subject.setup

      allow(thread).to receive(:wakeup) do
        allow(subject).to receive(:sleep).with(no_args).ordered
        allow(processor).to receive(:loop_for).with(1.234).ordered
        allow(ready).to receive(:<<).with(:ready)
        blocks[:thread_block].call
      end

      allow(reasons).to receive(:<<).with(:resume)
      subject.resume
    end

    it 'is not paused' 


    context 'when resume is called again' do
      it 'does nothing' 

    end

    context 'when wakeup_on_event is called' do
      let(:epoch) { 1234 }

      context 'when thread is alive' do
        before do
          allow(reasons).to receive(:<<)
          allow(thread).to receive(:alive?).and_return(true)
        end

        it 'wakes up the thread' 


        it 'sets the reason for waking up' 

      end

      context 'when thread is dead' do
        before do
          allow(thread).to receive(:alive?).and_return(false)
        end

        it 'does not wake up the thread' 

      end
    end
  end

  context 'when set up / paused' do
    before do
      allow(thread).to receive(:alive?).and_return(true)
      allow(config).to receive(:min_delay_between_events).and_return(1.234)

      allow(thread).to receive(:wakeup)

      subject.setup

      allow(subject).to receive(:sleep).with(no_args).ordered do
        allow(processor).to receive(:loop_for).with(1.234)
        blocks[:timer_block].call
      end

      allow(ready).to receive(:<<).with(:ready)
      allow(ready).to receive(:pop)

      blocks[:thread_block].call
    end

    describe '#resume' do
      before do
        allow(reasons).to receive(:<<)
        allow(thread).to receive(:wakeup)
      end

      it 'resumes the thread' 


      it 'sets the reason for waking up' 

    end

    describe '#teardown' do
      before do
        allow(reasons).to receive(:<<)
        allow(thread).to receive(:join)
      end

      it 'frees the thread' 


      it 'waits for the thread to finish' 


      it 'sets the reason for waking up' 

    end
  end
end

