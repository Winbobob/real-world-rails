require 'spec_helper'

describe CreateGpgSignatureWorker do
  let(:project) { create(:project, :repository) }
  let(:commits) { project.repository.commits('HEAD', limit: 3).commits }
  let(:commit_shas) { commits.map(&:id) }
  let(:gpg_commit) { instance_double(Gitlab::Gpg::Commit) }

  context 'when GpgKey is found' do
    before do
      allow(Project).to receive(:find_by).with(id: project.id).and_return(project)
      allow(project).to receive(:commits_by).with(oids: commit_shas).and_return(commits)
    end

    subject { described_class.new.perform(commit_shas, project.id) }

    it 'calls Gitlab::Gpg::Commit#signature' 


    it 'can recover from exception and continue the signature process' 

  end

  context 'handles when a string is passed in for the commit SHA' do
    it 'creates a signature once' 

  end

  context 'when Commit is not found' do
    let(:nonexisting_commit_sha) { '0beec7b5ea3f0fdbc95d0dd47f3c5bc275da8a34' }

    it 'does not raise errors' 

  end

  context 'when Project is not found' do
    let(:nonexisting_project_id) { -1 }

    it 'does not raise errors' 


    it 'does not call Gitlab::Gpg::Commit#signature' 

  end
end

