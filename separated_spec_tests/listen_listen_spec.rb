# encoding: UTF-8

RSpec.describe 'Listen', acceptance: true do
  let(:base_options) { { latency: 0.1 } }
  let(:polling_options) { {} }
  let(:options) { {} }
  let(:all_options) { base_options.merge(polling_options).merge(options) }

  let(:wrapper) { setup_listener(all_options, :track_changes) }
  before { wrapper.listener.start }
  after { wrapper.listener.stop }

  subject { wrapper }

  context 'with one listen dir' do
    let(:paths) { Pathname.new(Dir.pwd) }
    around { |example| fixtures { example.run } }

    context 'with change block raising' do
      let(:callback) { ->(_, _, _) { fail 'foo' } }
      let(:wrapper) { setup_listener(all_options, callback) }

      it 'warns the backtrace' 

    end

    modes =
      case ENV['TEST_LISTEN_ADAPTER_MODES'] || 'both'
      when 'polling'
        [true]
      when 'native'
        [false]
      else
        [false, true]
      end

    # TODO: make it configurable
    # TODO: restore
    modes.each do |polling|
      context "force_polling option to #{polling}" do
        let(:polling_options) { { force_polling: polling } }

        if polling
          context 'when polling' do
            context 'with a large latency' do
              let(:options) { { latency: 10 } }
              it 'passes the latency option correctly' 

            end
          end
        else
          unless darwin?
            context 'when driver does not support option' do
              let(:options) { { latency: 10 } }
              it 'does not pass the latency option' 

            end
          end
        end

        context 'with default ignore options' do
          context 'with nothing in listen dir' do
            it { is_expected.to process_addition_of('file.rb') }
            it { is_expected.to process_addition_of('.hidden') }

            it 'listens to multiple files addition' 


            it 'listens to file moved inside' 

          end

          context 'existing file.rb in listen dir' do
            around do |example|
              change_fs(:added, 'file.rb')
              example.run
            end

            it { is_expected.to process_modification_of('file.rb') }
            it { is_expected.to process_removal_of('file.rb') }

            it 'listens to file.rb moved out' 


            it 'listens to file mode change' 

          end

          context 'hidden file in listen dir' do
            around do |example|
              change_fs(:added, '.hidden')
              example.run
            end

            it { is_expected.to process_modification_of('.hidden') }
          end

          context 'dir in listen dir' do
            around do |example|
              mkdir_p 'dir'
              example.run
            end

            it { is_expected.to process_addition_of('dir/file.rb') }
          end

          context 'dir with file in listen dir' do
            around do |example|
              mkdir_p 'dir'
              touch 'dir/file.rb'
              example.run
            end

            it 'listens to file move' 

          end

          context 'two dirs with files in listen dir' do
            around do |example|
              mkdir_p 'dir1'
              touch 'dir1/file1.rb'
              mkdir_p 'dir2'
              touch 'dir2/file2.rb'
              example.run
            end

            it 'listens to multiple file moves' 


            it 'listens to dir move' 

          end

          context 'with .bundle dir ignored by default' do
            around do |example|
              mkdir_p '.bundle'
              example.run
            end

            it { is_expected.not_to process_addition_of('.bundle/file.rb') }
          end
        end

        context 'when :ignore is *ignored_dir*' do
          context 'ignored dir with file in listen dir' do
            let(:options) { { ignore: /ignored_dir/ } }

            around do |example|
              mkdir_p 'ignored_dir'
              example.run
            end

            it { is_expected.not_to process_addition_of('ignored_dir/file.rb') }
          end

          context 'when :only is *.rb' do
            let(:options) { { only: /\.rb$/ } }

            it { is_expected.to process_addition_of('file.rb') }
            it { is_expected.not_to process_addition_of('file.txt') }
          end

          context 'when :ignore is bar.rb' do
            context 'when :only is *.rb' do
              let(:options) { { ignore: /bar\.rb$/, only: /\.rb$/ } }

              it { is_expected.to process_addition_of('file.rb') }
              it { is_expected.not_to process_addition_of('file.txt') }
              it { is_expected.not_to process_addition_of('bar.rb') }
            end
          end

          context 'when default ignore is *.rb' do
            let(:options) { { ignore: /\.rb$/ } }

            it { is_expected.not_to process_addition_of('file.rb') }

            context 'with #ignore on *.txt mask' do
              before { wrapper.listener.ignore(/\.txt/) }

              it { is_expected.not_to process_addition_of('file.rb') }
              it { is_expected.not_to process_addition_of('file.txt') }
            end

            context 'with #ignore! on *.txt mask' do
              before { wrapper.listener.ignore!(/\.txt/) }

              it { is_expected.to process_addition_of('file.rb') }
              it { is_expected.not_to process_addition_of('file.txt') }
            end
          end
        end
      end
    end
  end
end

