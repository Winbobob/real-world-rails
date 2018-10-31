require 'spec_helper'

describe CreateGpgSignatureWorker do
  let(:project) { create(:project, :repository) }

  context 'when GpgKey is found' do
    let(:commit_sha) { '0beec7b5ea3f0fdbc95d0dd47f3c5bc275da8a33' }

    it 'calls Gitlab::Gpg::Commit#signature' 

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

