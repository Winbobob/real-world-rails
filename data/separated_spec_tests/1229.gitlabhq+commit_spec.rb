require 'rails_helper'

describe Gitlab::Gpg::Commit do
  describe '#signature' do
    shared_examples 'returns the cached signature on second call' do
      it 'returns the cached signature on second call' 

    end

    let!(:project) { create :project, :repository, path: 'sample-project' }
    let!(:commit_sha) { '0beec7b5ea3f0fdbc95d0dd47f3c5bc275da8a33' }

    context 'unsigned commit' do
      let!(:commit) { create :commit, project: project, sha: commit_sha }

      it 'returns nil' 

    end

    context 'known key' do
      context 'user matches the key uid' do
        context 'user email matches the email committer' do
          let!(:commit) { create :commit, project: project, sha: commit_sha, committer_email: GpgHelpers::User1.emails.first }

          let!(:user) { create(:user, email: GpgHelpers::User1.emails.first) }

          let!(:gpg_key) do
            create :gpg_key, key: GpgHelpers::User1.public_key, user: user
          end

          before do
            allow(Gitlab::Git::Commit).to receive(:extract_signature_lazily)
            .with(Gitlab::Git::Repository, commit_sha)
            .and_return(
              [
                GpgHelpers::User1.signed_commit_signature,
                GpgHelpers::User1.signed_commit_base_data
              ]
            )
          end

          it 'returns a valid signature' 


          it_behaves_like 'returns the cached signature on second call'

          context 'read-only mode' do
            before do
              allow(Gitlab::Database).to receive(:read_only?).and_return(true)
            end

            it 'does not create a cached signature' 

          end
        end

        context 'commit signed with a subkey' do
          let!(:commit) { create :commit, project: project, sha: commit_sha, committer_email: GpgHelpers::User3.emails.first }

          let!(:user) { create(:user, email: GpgHelpers::User3.emails.first) }

          let!(:gpg_key) do
            create :gpg_key, key: GpgHelpers::User3.public_key, user: user
          end

          let(:gpg_key_subkey) do
            gpg_key.subkeys.find_by(fingerprint: '0522DD29B98F167CD8421752E38FFCAF75ABD92A')
          end

          before do
            allow(Gitlab::Git::Commit).to receive(:extract_signature_lazily)
            .with(Gitlab::Git::Repository, commit_sha)
            .and_return(
              [
                GpgHelpers::User3.signed_commit_signature,
                GpgHelpers::User3.signed_commit_base_data
              ]
            )
          end

          it 'returns a valid signature' 


          it_behaves_like 'returns the cached signature on second call'
        end

        context 'user email does not match the committer email, but is the same user' do
          let!(:commit) { create :commit, project: project, sha: commit_sha, committer_email: GpgHelpers::User2.emails.first }

          let(:user) do
            create(:user, email: GpgHelpers::User1.emails.first).tap do |user|
              create :email, user: user, email: GpgHelpers::User2.emails.first
            end
          end

          let!(:gpg_key) do
            create :gpg_key, key: GpgHelpers::User1.public_key, user: user
          end

          before do
            allow(Gitlab::Git::Commit).to receive(:extract_signature_lazily)
            .with(Gitlab::Git::Repository, commit_sha)
            .and_return(
              [
                GpgHelpers::User1.signed_commit_signature,
                GpgHelpers::User1.signed_commit_base_data
              ]
            )
          end

          it 'returns an invalid signature' 


          it_behaves_like 'returns the cached signature on second call'
        end

        context 'user email does not match the committer email' do
          let!(:commit) { create :commit, project: project, sha: commit_sha, committer_email: GpgHelpers::User2.emails.first }

          let(:user) { create(:user, email: GpgHelpers::User1.emails.first) }

          let!(:gpg_key) do
            create :gpg_key, key: GpgHelpers::User1.public_key, user: user
          end

          before do
            allow(Gitlab::Git::Commit).to receive(:extract_signature_lazily)
            .with(Gitlab::Git::Repository, commit_sha)
            .and_return(
              [
                GpgHelpers::User1.signed_commit_signature,
                GpgHelpers::User1.signed_commit_base_data
              ]
            )
          end

          it 'returns an invalid signature' 


          it_behaves_like 'returns the cached signature on second call'
        end
      end

      context 'user does not match the key uid' do
        let!(:commit) { create :commit, project: project, sha: commit_sha }

        let(:user) { create(:user, email: GpgHelpers::User2.emails.first) }

        let!(:gpg_key) do
          create :gpg_key, key: GpgHelpers::User1.public_key, user: user
        end

        before do
          allow(Gitlab::Git::Commit).to receive(:extract_signature_lazily)
          .with(Gitlab::Git::Repository, commit_sha)
          .and_return(
            [
              GpgHelpers::User1.signed_commit_signature,
              GpgHelpers::User1.signed_commit_base_data
            ]
          )
        end

        it 'returns an invalid signature' 


        it_behaves_like 'returns the cached signature on second call'
      end
    end

    context 'unknown key' do
      let!(:commit) { create :commit, project: project, sha: commit_sha }

      before do
        allow(Gitlab::Git::Commit).to receive(:extract_signature_lazily)
          .with(Gitlab::Git::Repository, commit_sha)
          .and_return(
            [
              GpgHelpers::User1.signed_commit_signature,
              GpgHelpers::User1.signed_commit_base_data
            ]
          )
      end

      it 'returns an invalid signature' 


      it_behaves_like 'returns the cached signature on second call'
    end
  end
end

