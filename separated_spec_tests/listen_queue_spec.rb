require 'listen/event/queue'

# TODO: not part of listener really
RSpec.describe Listen::Event::Queue do
  let(:queue) { instance_double(Thread::Queue, 'my queue') }

  let(:config) { instance_double(Listen::Event::Queue::Config) }

  let(:relative) { false }

  let(:block) { proc {} }

  subject { described_class.new(config, &block) }

  before do
    allow(config).to receive(:relative?).and_return(relative)
    allow(Thread::Queue).to receive(:new).and_return(queue)
  end

  describe '#empty?' do
    before do
      allow(queue).to receive(:empty?).and_return(empty)
    end

    context 'when empty' do
      let(:empty) { true }
      it { is_expected.to be_empty }
    end

    context 'when not empty' do
      let(:empty) { false }
      let(:watched_dir) { fake_path('watched_dir') }
      before do
        allow(queue).to receive(:empty?).and_return(false)
      end
      it { is_expected.to_not be_empty }
    end
  end

  describe '#pop' do
    before do
      allow(queue).to receive(:pop).and_return('foo')
    end

    context 'when empty' do
      let(:value) { 'foo' }
      it 'forward the call to the queue' 

    end
  end

  describe '#<<' do
    let(:watched_dir) { fake_path('watched_dir') }
    before do
      allow(queue).to receive(:<<)
    end

    context 'when a block is given' do
      let(:calls) { [] }
      let(:block) { proc { calls << 'called!' } }

      it 'calls the provided block' 

    end

    context 'when no block is given' do
      let(:calls) { [] }
      let(:block) { nil }

      it 'calls the provided block' 

    end

    context 'when relative option is true' do
      let(:relative) { true }

      context 'when watched dir is the current dir' do
        let(:options) { { relative: true, directories: Pathname.pwd } }

        let(:dir_rel_path) { fake_path('.') }
        let(:foo_rel_path) { fake_path('foo', exist?: true) }

        it 'registers relative paths' 

      end

      context 'when watched dir is not the current dir' do
        let(:options) { { relative: true } }
        let(:dir_rel_path) { fake_path('..') }
        let(:foo_rel_path) { fake_path('../foo', exist?: true) }

        it 'registers relative path' 

      end

      context 'when watched dir is on another drive' do
        let(:watched_dir) { fake_path('watched_dir', realpath: 'd:/foo') }
        let(:foo_rel_path) { fake_path('d:/foo', exist?: true) }

        it 'registers full path' 

      end
    end
  end
end

