require 'spec_helper'

class TestHelpersTest
  include Gitlab::TaskHelpers
end

describe Gitlab::TaskHelpers do
  subject { TestHelpersTest.new }

  let(:repo) { 'https://gitlab.com/gitlab-org/gitlab-test.git' }
  let(:clone_path) { Rails.root.join('tmp/tests/task_helpers_tests').to_s }
  let(:version) { '1.1.0' }
  let(:tag) { 'v1.1.0' }

  describe '#checkout_or_clone_version' do
    before do
      allow(subject).to receive(:run_command!)
    end

    it 'checkout the version and reset to it' 


    context 'with a branch version' do
      let(:version) { '=branch_name' }
      let(:branch) { 'branch_name' }

      it 'checkout the version and reset to it with a branch name' 

    end

    context "target_dir doesn't exist" do
      it 'clones the repo' 

    end

    context 'target_dir exists' do
      before do
        expect(Dir).to receive(:exist?).and_return(true)
      end

      it "doesn't clone the repository" 

    end
  end

  describe '#clone_repo' do
    it 'clones the repo in the target dir' 

  end

  describe '#checkout_version' do
    it 'clones the repo in the target dir' 

  end

  describe '#run_command' do
    it 'runs command and return the output' 


    it 'returns empty string when command doesnt exist' 

  end

  describe '#run_command!' do
    it 'runs command and return the output' 


    it 'returns and exception when command exit with non zero code' 

  end
end

