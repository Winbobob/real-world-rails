require 'spec_helper'

describe Gitlab::GitAccessWiki do
  let(:access) { described_class.new(user, project, 'web', authentication_abilities: authentication_abilities, redirected_path: redirected_path) }
  let(:project) { create(:project, :wiki_repo) }
  let(:user) { create(:user) }
  let(:changes) { ['6f6d7e7ed 570e7b2ab refs/heads/master'] }
  let(:redirected_path) { nil }
  let(:authentication_abilities) do
    [
      :read_project,
      :download_code,
      :push_code
    ]
  end

  describe '#push_access_check' do
    context 'when user can :create_wiki' do
      before do
        create(:protected_branch, name: 'master', project: project)
        project.add_developer(user)
      end

      subject { access.check('git-receive-pack', changes) }

      it { expect { subject }.not_to raise_error }

      context 'when in a read-only GitLab instance' do
        before do
          allow(Gitlab::Database).to receive(:read_only?) { true }
        end

        it 'does not give access to upload wiki code' 

      end
    end
  end

  describe '#access_check_download!' do
    subject { access.check('git-upload-pack', '_any') }

    before do
      project.add_developer(user)
    end

    context 'when wiki feature is enabled' do
      it 'give access to download wiki code' 


      context 'when the wiki repository does not exist' do
        it 'returns not found' 

      end
    end

    context 'when wiki feature is disabled' do
      it 'does not give access to download wiki code' 

    end
  end
end

