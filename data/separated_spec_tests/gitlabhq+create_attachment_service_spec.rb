# frozen_string_literal: true
require 'spec_helper'

describe Wikis::CreateAttachmentService do
  let(:project) { create(:project, :wiki_repo) }
  let(:user) { create(:user) }
  let(:file_name) { 'filename.txt' }
  let(:file_path_regex) { %r{#{described_class::ATTACHMENT_PATH}/\h{32}/#{file_name}} }

  let(:file_opts) do
    {
      file_name: file_name,
      file_content: 'Content of attachment'
    }
  end
  let(:opts) { file_opts }

  subject(:service) { described_class.new(project, user, opts) }

  before do
    project.add_developer(user)
  end

  describe 'initialization' do
    context 'author commit info' do
      it 'does not raise error if user is nil' 


      it 'fills file_path from the repository uploads folder' 


      context 'when no author info provided' do
        it 'fills author_email and author_name from current_user info' 

      end

      context 'when author info provided' do
        let(:author_email) { 'author_email' }
        let(:author_name) { 'author_name' }
        let(:opts) { file_opts.merge(author_email: author_email, author_name: author_name) }

        it 'fills author_email and author_name from params' 

      end
    end

    context 'commit message' do
      context 'when no commit message provided' do
        it 'sets a default commit message' 

      end

      context 'when commit message provided' do
        let(:commit_message) { 'whatever' }
        let(:opts) { file_opts.merge(commit_message: commit_message) }

        it 'use the commit message from params' 

      end
    end

    context 'branch name' do
      context 'when no branch provided' do
        it 'sets the branch from the wiki default_branch' 

      end

      context 'when branch provided' do
        let(:branch_name) { 'whatever' }
        let(:opts) { file_opts.merge(branch_name: branch_name) }

        it 'use the commit message from params' 

      end
    end
  end

  describe '#parse_file_name' do
    context 'when file_name' do
      context 'has white spaces' do
        let(:file_name) { 'file with spaces' }

        it "replaces all of them with '_'" 

      end

      context 'has other invalid characters' do
        let(:file_name) { "file\twith\tinvalid chars" }

        it "replaces all of them with '_'" 

      end

      context 'is not present' do
        let(:file_name) { nil }

        it 'returns error' 

      end

      context 'length' do
        context 'is bigger than 255' do
          let(:file_name) { "#{'0' * 256}.jpg" }

          it 'truncates file name' 

        end

        context 'is less or equal to 255 does not return error' do
          let(:file_name) { '0' * 255 }

          it 'does not return error' 

        end
      end
    end

    context 'when user' do
      shared_examples 'wiki attachment user validations' do
        it 'returns error' 

      end

      context 'does not have permission' do
        let(:user2) { create(:user) }

        it_behaves_like 'wiki attachment user validations'
      end

      context 'is nil' do
        let(:user2) { nil }

        it_behaves_like 'wiki attachment user validations'
      end
    end
  end

  describe '#execute' do
    let(:wiki) { project.wiki }
    subject(:service_execute) { service.execute[:result] }

    context 'creates branch if it does not exists' do
      let(:branch_name) { 'new_branch' }
      let(:opts) { file_opts.merge(branch_name: branch_name) }

      it do
        expect(wiki.repository.branches).to be_empty
        expect { service.execute }.to change { wiki.repository.branches.count }.by(1)
        expect(wiki.repository.branches.first.name).to eq branch_name
      end
    end

    it 'adds file to the repository' 


    context 'returns' do
      before do
        allow(SecureRandom).to receive(:hex).and_return('fixed_hex')

        service_execute
      end

      it 'returns the file name' 


      it 'returns the path where file was stored' 


      it 'returns the branch where the file was pushed' 


      it 'returns the commit id' 

    end
  end
end

