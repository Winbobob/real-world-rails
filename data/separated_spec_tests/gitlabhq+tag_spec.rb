require "spec_helper"

describe Gitlab::Git::Tag, :seed_helper do
  let(:repository) { Gitlab::Git::Repository.new('default', TEST_REPO_PATH, '') }

  shared_examples 'Gitlab::Git::Repository#tags' do
    describe 'first tag' do
      let(:tag) { repository.tags.first }

      it { expect(tag.name).to eq("v1.0.0") }
      it { expect(tag.target).to eq("f4e6814c3e4e7a0de82a9e7cd20c626cc963a2f8") }
      it { expect(tag.dereferenced_target.sha).to eq("6f6d7e7ed97bb5f0054f2b1df789b39ca89b6ff9") }
      it { expect(tag.message).to eq("Release") }
    end

    describe 'last tag' do
      let(:tag) { repository.tags.last }

      it { expect(tag.name).to eq("v1.2.1") }
      it { expect(tag.target).to eq("2ac1f24e253e08135507d0830508febaaccf02ee") }
      it { expect(tag.dereferenced_target.sha).to eq("fa1b1e6c004a68b7d8763b86455da9e6b23e36d6") }
      it { expect(tag.message).to eq("Version 1.2.1") }
    end

    it { expect(repository.tags.size).to eq(SeedRepo::Repo::TAGS.size) }
  end

  context 'when Gitaly tags feature is enabled' do
    it_behaves_like 'Gitlab::Git::Repository#tags'
  end

  context 'when Gitaly tags feature is disabled', :skip_gitaly_mock do
    it_behaves_like 'Gitlab::Git::Repository#tags'
  end

  describe '.get_message' do
    let(:tag_ids) { %w[f4e6814c3e4e7a0de82a9e7cd20c626cc963a2f8 8a2a6eb295bb170b34c24c76c49ed0e9b2eaf34b] }

    subject do
      tag_ids.map { |id| described_class.get_message(repository, id) }
    end

    shared_examples 'getting tag messages' do
      it 'gets tag messages' 

    end

    context 'when Gitaly tag_messages feature is enabled' do
      it_behaves_like 'getting tag messages'

      it 'gets messages in one batch', :request_store do
        expect { subject.map(&:itself) }.to change { Gitlab::GitalyClient.get_request_count }.by(1)
      end
    end

    context 'when Gitaly tag_messages feature is disabled', :disable_gitaly do
      it_behaves_like 'getting tag messages'
    end
  end

  describe 'tag into from Gitaly tag' do
    context 'message_size != message.size' do
      let(:gitaly_tag) { build(:gitaly_tag, message: ''.b, message_size: message_size) }
      let(:tag) { described_class.new(repository, gitaly_tag) }

      context 'message_size less than threshold' do
        let(:message_size) { 123 }

        it 'fetches tag message seperately' 

      end

      context 'message_size greater than threshold' do
        let(:message_size) { described_class::MAX_TAG_MESSAGE_DISPLAY_SIZE + 1 }

        it 'returns a notice about message size' 

      end
    end
  end
end

