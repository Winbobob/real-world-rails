RSpec.describe Listen::Change do
  let(:config) { instance_double(Listen::Change::Config) }
  let(:dir) { instance_double(Pathname) }
  let(:record) { instance_double(Listen::Record, root: '/dir') }
  subject { Listen::Change.new(config, record) }

  let(:full_file_path) { instance_double(Pathname, to_s: '/dir/file.rb') }
  let(:full_dir_path) { instance_double(Pathname, to_s: '/dir') }

  before do
    allow(dir).to receive(:+).with('file.rb') { full_file_path }
    allow(dir).to receive(:+).with('dir1') { full_dir_path }
  end

  describe '#change' do
    before do
      allow(config).to receive(:silenced?).and_return(false)
    end

    context 'with build options' do
      it 'calls still_building! on record' 

    end

    context 'file' do
      context 'with known change' do
        it 'notifies change directly to listener' 


        it "doesn't notify to listener if path is silenced" 

      end

      context 'with unknown change' do
        it 'calls Listen::File#change' 


        it "doesn't call Listen::File#change if path is silenced" 


        context 'that returns a change' do
          before { allow(Listen::File).to receive(:change) { :modified } }

          context 'listener listen' do
            it 'notifies change to listener' 


            context 'silence option' do
              it 'notifies change to listener' 

            end
          end
        end

        context 'that returns no change' do
          before { allow(Listen::File).to receive(:change) { nil } }

          it "doesn't notifies no change" 

        end
      end
    end

    context 'directory' do
      let(:dir_options) { { recursive: true } }

      it 'calls Listen::Directory#new' 

    end
  end
end

