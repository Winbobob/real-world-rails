require 'spec_helper'

describe Gitlab::Git::HooksService, seed_helper: true do
  let(:gl_id) { 'user-456' }
  let(:gl_username) { 'janedoe' }
  let(:user) { Gitlab::Git::User.new(gl_username, 'Jane Doe', 'janedoe@example.com', gl_id) }
  let(:repository) { Gitlab::Git::Repository.new('default', TEST_REPO_PATH, 'project-123') }
  let(:service) { described_class.new }
  let(:blankrev) { Gitlab::Git::BLANK_SHA }
  let(:oldrev) { SeedRepo::Commit::PARENT_ID }
  let(:newrev) { SeedRepo::Commit::ID }
  let(:ref) { 'refs/heads/feature' }

  describe '#execute' do
    context 'when receive hooks were successful' do
      let(:hook) { double(:hook) }

      it 'calls all three hooks' 

    end

    context 'when pre-receive hook failed' do
      it 'does not call post-receive hook' 

    end

    context 'when update hook failed' do
      it 'does not call post-receive hook' 

    end
  end
end

