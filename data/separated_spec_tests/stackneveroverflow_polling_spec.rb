require 'spec_helper'

describe Listen::Adapters::Polling do
  subject { described_class.new('dir') }

  it_should_behave_like 'a filesystem adapter'

  describe '#initialize' do
    it 'sets the latency to the default polling one' 

  end

  describe '#poll' do
    let(:listener) { double(Listen::Listener) }
    let(:callback) { lambda { |changed_directories, options| @called = true; listener.on_change(changed_directories, options) } }

    after { subject.stop }

    context 'with one directory to watch' do
      subject { Listen::Adapters::Polling.new('dir', {}, &callback) }

      it 'calls listener.on_change' 


      it 'calls listener.on_change continuously' 


      it "doesn't call listener.on_change if paused" 

    end

    context 'with multiple directories to watch' do
      subject { Listen::Adapters::Polling.new(%w{dir1 dir2}, {}, &callback) }

      it 'calls listener.on_change' 


      it 'calls listener.on_change continuously' 


      it "doesn't call listener.on_change if paused" 

    end
  end
end

