require 'rails_helper'

RSpec.describe Gitlab::Gpg::InvalidGpgSignatureUpdater do
  describe '#run' do
    let(:signature)       { [GpgHelpers::User1.signed_commit_signature, GpgHelpers::User1.signed_commit_base_data] }
    let(:committer_email) { GpgHelpers::User1.emails.first }
    let!(:commit_sha)     { '0beec7b5ea3f0fdbc95d0dd47f3c5bc275da8a33' }
    let!(:project)        { create :project, :repository, path: 'sample-project' }
    let!(:raw_commit) do
      raw_commit = double(
        :raw_commit,
        signature: signature,
        sha: commit_sha,
        committer_email: committer_email
      )

      allow(raw_commit).to receive :save!

      raw_commit
    end

    let!(:commit) do
      create :commit, git_commit: raw_commit, project: project
    end

    before do
      allow_any_instance_of(Project).to receive(:commit).and_return(commit)

      allow(Gitlab::Git::Commit).to receive(:extract_signature_lazily)
        .with(Gitlab::Git::Repository, commit_sha)
        .and_return(signature)
    end

    context 'gpg signature did have an associated gpg key which was removed later' do
      let!(:user) { create :user, email: GpgHelpers::User1.emails.first }

      let!(:valid_gpg_signature) do
        create :gpg_signature,
          project: project,
          commit_sha: commit_sha,
          gpg_key: nil,
          gpg_key_primary_keyid: GpgHelpers::User1.primary_keyid,
          verification_status: 'verified'
      end

      it 'assigns the gpg key to the signature when the missing gpg key is added' 


      it 'does not assign the gpg key when an unrelated gpg key is added' 

    end

    context 'gpg signature did not have an associated gpg key' do
      let!(:user) { create :user, email: GpgHelpers::User1.emails.first }

      let!(:invalid_gpg_signature) do
        create :gpg_signature,
          project: project,
          commit_sha: commit_sha,
          gpg_key: nil,
          gpg_key_primary_keyid: GpgHelpers::User1.primary_keyid,
          verification_status: 'unknown_key'
      end

      it 'updates the signature to being valid when the missing gpg key is added' 


      it 'keeps the signature at being invalid when an unrelated gpg key is added' 

    end

    context 'gpg signature did have an associated unverified gpg key' do
      let!(:user) do
        create(:user, email: 'unrelated@example.com').tap do |user|
          user.skip_reconfirmation!
        end
      end

      let!(:invalid_gpg_signature) do
        create :gpg_signature,
          project: project,
          commit_sha: commit_sha,
          gpg_key: nil,
          gpg_key_primary_keyid: GpgHelpers::User1.primary_keyid,
          verification_status: 'unknown_key'
      end

      it 'updates the signature to being valid when the user updates the email address' 


      it 'keeps the signature at being invalid when the changed email address is still unrelated' 

    end

    context 'gpg signature did not have an associated gpg subkey' do
      let(:signature)       { [GpgHelpers::User3.signed_commit_signature, GpgHelpers::User3.signed_commit_base_data] }
      let(:committer_email) { GpgHelpers::User3.emails.first }
      let!(:user)           { create :user, email: GpgHelpers::User3.emails.first }

      let!(:invalid_gpg_signature) do
        create :gpg_signature,
          project: project,
          commit_sha: commit_sha,
          gpg_key: nil,
          gpg_key_primary_keyid: GpgHelpers::User3.subkey_fingerprints.last[24..-1],
          verification_status: 'unknown_key'
      end

      it 'updates the signature to being valid when the missing gpg key is added' 

    end
  end
end

