require 'listen/adapter/config'

RSpec.describe Listen::Adapter::Config do
  let(:directories) { [path1, path2] }
  let(:queue) { instance_double(Queue) }
  let(:silencer) { instance_double(Listen::Silencer) }

  # NOTE: defaults are handled later in Listen::Options
  let(:adapter_options) { { latency: 1.234 } }

  subject do
    described_class.new(directories, queue, silencer, adapter_options)
  end

  # Here's what may be  passed to initializer
  let(:path1) { fake_path('/real/path1', realpath: real_path1) }
  let(:path2) { fake_path('/real/path2', realpath: real_path2) }

  let(:current_path) do
    fake_path('/real/current_path', realpath: real_current_path)
  end

  let(:symlinked_dir1) { fake_path('symlinked_dir1', realpath: real_path1) }
  let(:symlinked_dir2) { fake_path('symlinked_dir1', realpath: real_path2) }

  # Here's what expected to be returned (just so that realpath() calls return
  # something useful)
  let(:real_path1) { fake_path('/real/path1') }
  let(:real_path2) { fake_path('/real/path2') }
  let(:real_current_path) { fake_path('/real/current_path') }

  before do
    allow(Pathname).to receive(:new) do |*args|
      fail "unstubbed Pathname.new(#{args.map(&:inspect) * ','})"
    end

    allow(Pathname).to receive(:new).with('/real/path1').and_return(path1)
    allow(Pathname).to receive(:new).with('/real/path2').and_return(path2)

    allow(Pathname).to receive(:new).with(path1).and_return(path1)
    allow(Pathname).to receive(:new).with(path2).and_return(path2)

    allow(Pathname).to receive(:new).with('symlinked_dir1').
      and_return(symlinked_dir1)

    allow(Pathname).to receive(:new).with('symlinked_dir2').
      and_return(symlinked_dir2)

    allow(Dir).to receive(:pwd).and_return('/real/current_path')

    allow(Pathname).to receive(:new).
      with('/real/current_path').and_return(current_path)
  end

  describe '#initialize' do
    context 'with directories as array' do
      context 'with strings for directories' do
        context 'when already resolved' do
          let(:directories) { ['/real/path1', '/real/path2'] }
          it 'returns array of pathnames' 

        end

        context 'when not resolved' do
          let(:directories) { %w(symlinked_dir1 symlinked_dir2) }
          it 'returns array of resolved pathnames' 

        end
      end

      context 'with Pathnames for directories' do
        let(:directories) { [path1, path2] }
        it 'returns array of pathnames' 

      end
    end

    context 'with directories as messy array' do
      pending 'implement me'
    end

    context 'with no directories' do
      let(:directories) {}
      it 'returns the current path in array' 

    end
  end

  describe '#adapter_options' do
    it 'provides a set of adapter_specific options' 

  end

  describe '#queue' do
    it 'provides a direct queue for filesystem events' 

  end

  describe '#silencer' do
    it 'provides a silencer object' 

  end
end
