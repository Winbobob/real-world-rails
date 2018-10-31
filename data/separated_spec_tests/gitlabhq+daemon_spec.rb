require 'spec_helper'

describe Gitlab::Daemon do
  subject { described_class.new }

  before do
    allow(subject).to receive(:start_working)
    allow(subject).to receive(:stop_working)
  end

  describe '.instance' do
    before do
      allow(Kernel).to receive(:at_exit)
    end

    after do
      described_class.instance_variable_set(:@instance, nil)
    end

    it 'provides instance of Daemon' 


    it 'subsequent invocations provide the same instance' 


    it 'creates at_exit hook when instance is created' 

  end

  describe 'when Daemon is enabled' do
    before do
      allow(subject).to receive(:enabled?).and_return(true)
    end

    describe 'when Daemon is stopped' do
      describe '#start' do
        it 'starts the Daemon' 

      end

      describe '#stop' do
        it "doesn't shutdown stopped Daemon" 

      end
    end

    describe 'when Daemon is running' do
      before do
        subject.start.join
      end

      describe '#start' do
        it "doesn't start running Daemon" 

      end

      describe '#stop' do
        it 'shutdowns Daemon' 

      end
    end
  end

  describe 'when Daemon is disabled' do
    before do
      allow(subject).to receive(:enabled?).and_return(false)
    end

    describe '#start' do
      it "doesn't start working" 

    end

    describe '#stop' do
      it "doesn't stop working" 

    end
  end
end

