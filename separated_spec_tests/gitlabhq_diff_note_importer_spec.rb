require 'spec_helper'

describe Gitlab::GithubImport::Importer::DiffNoteImporter do
  let(:project) { create(:project) }
  let(:client) { double(:client) }
  let(:user) { create(:user) }
  let(:created_at) { Time.new(2017, 1, 1, 12, 00) }
  let(:updated_at) { Time.new(2017, 1, 1, 12, 15) }

  let(:hunk) do
    '@@ -1 +1 @@
    -Hello
    +Hello world'
  end

  let(:note) do
    Gitlab::GithubImport::Representation::DiffNote.new(
      noteable_type: 'MergeRequest',
      noteable_id: 1,
      commit_id: '123abc',
      file_path: 'README.md',
      diff_hunk: hunk,
      author: Gitlab::GithubImport::Representation::User
        .new(id: user.id, login: user.username),
      note: 'Hello',
      created_at: created_at,
      updated_at: updated_at,
      github_id: 1
    )
  end

  let(:importer) { described_class.new(note, project, client) }

  describe '#execute' do
    context 'when the merge request no longer exists' do
      it 'does not import anything' 

    end

    context 'when the merge request exists' do
      let!(:merge_request) do
        create(:merge_request, source_project: project, target_project: project)
      end

      before do
        allow(importer)
          .to receive(:find_merge_request_id)
          .and_return(merge_request.id)
      end

      it 'imports the note' 


      it 'imports the note when the author could not be found' 


      it 'produces a valid LegacyDiffNote' 


      it 'does not import the note when a foreign key error is raised' 

    end
  end

  describe '#find_merge_request_id' do
    it 'returns a merge request ID' 

  end
end

