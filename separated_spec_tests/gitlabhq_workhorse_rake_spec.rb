require 'rake_helper'

describe 'gitlab:workhorse namespace rake task' do
  before :all do
    Rake.application.rake_require 'tasks/gitlab/workhorse'
  end

  describe 'install' do
    let(:repo) { 'https://gitlab.com/gitlab-org/gitlab-workhorse.git' }
    let(:clone_path) { Rails.root.join('tmp/tests/gitlab-workhorse').to_s }
    let(:version) { File.read(Rails.root.join(Gitlab::Workhorse::VERSION_FILE)).chomp }

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
      before do
        FileUtils.mkdir_p(clone_path)
        expect(Dir).to receive(:chdir).with(clone_path).and_call_original
      end

      context 'gmake is available' do
        before do
          expect(main_object).to receive(:checkout_or_clone_version)
          allow(Object).to receive(:run_command!).with(['gmake']).and_return(true)
        end

        it 'calls gmake in the gitlab-workhorse directory' 

      end

      context 'gmake is not available' do
        before do
          expect(main_object).to receive(:checkout_or_clone_version)
          allow(main_object).to receive(:run_command!).with(['make']).and_return(true)
        end

        it 'calls make in the gitlab-workhorse directory' 

      end
    end
  end
end

