require 'rake_helper'

describe 'gitlab:gitaly namespace rake task' do
  before :all do
    Rake.application.rake_require 'tasks/gitlab/gitaly'
  end

  describe 'install' do
    let(:repo) { 'https://gitlab.com/gitlab-org/gitaly.git' }
    let(:clone_path) { Rails.root.join('tmp/tests/gitaly').to_s }
    let(:version) { File.read(Rails.root.join(Gitlab::GitalyClient::SERVER_VERSION_FILE)).chomp }

    context 'no dir given' do
      it 'aborts and display a help message' 

    end

    context 'when an underlying Git command fail' do
      it 'aborts and display a help message' 

    end

    describe 'checkout or clone' do
      before do
        expect(Dir).to receive(:chdir).with(clone_path)
      end

      it 'calls checkout_or_clone_version with the right arguments' 

    end

    describe 'gmake/make' do
      let(:command_preamble) { %w[/usr/bin/env -u RUBYOPT -u BUNDLE_GEMFILE] }

      before do
        stub_env('CI', false)
        FileUtils.mkdir_p(clone_path)
        expect(Dir).to receive(:chdir).with(clone_path).and_call_original
        allow(Rails.env).to receive(:test?).and_return(false)
      end

      context 'gmake is available' do
        before do
          expect(main_object).to receive(:checkout_or_clone_version)
        end

        it 'calls gmake in the gitaly directory' 

      end

      context 'gmake is not available' do
        before do
          expect(main_object).to receive(:checkout_or_clone_version)
          expect(Gitlab::Popen).to receive(:popen).with(%w[which gmake]).and_return(['', 42])
        end

        it 'calls make in the gitaly directory' 


        context 'when Rails.env is test' do
          let(:command) do
            %W[make
               BUNDLE_FLAGS=--no-deployment
               BUNDLE_PATH=#{Bundler.bundle_path}]
          end

          before do
            allow(Rails.env).to receive(:test?).and_return(true)
          end

          it 'calls make in the gitaly directory with --no-deployment flag for bundle' 

        end
      end
    end
  end

  describe 'storage_config' do
    it 'prints storage configuration in a TOML format' 

  end
end

