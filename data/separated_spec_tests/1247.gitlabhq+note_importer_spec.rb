require 'spec_helper'

describe Gitlab::GithubImport::Importer::NoteImporter do
  let(:client) { double(:client) }
  let(:project) { create(:project) }
  let(:user) { create(:user) }
  let(:created_at) { Time.new(2017, 1, 1, 12, 00) }
  let(:updated_at) { Time.new(2017, 1, 1, 12, 15) }

  let(:github_note) do
    Gitlab::GithubImport::Representation::Note.new(
      noteable_id: 1,
      noteable_type: 'Issue',
      author: Gitlab::GithubImport::Representation::User.new(id: 4, login: 'alice'),
      note: 'This is my note',
      created_at: created_at,
      updated_at: updated_at,
      github_id: 1
    )
  end

  let(:importer) { described_class.new(github_note, project, client) }

  describe '#execute' do
    context 'when the noteable exists' do
      let!(:issue_row) { create(:issue, project: project, iid: 1) }

      before do
        allow(importer)
          .to receive(:find_noteable_id)
          .and_return(issue_row.id)
      end

      context 'when the author could be found' do
        it 'imports the note with the found author as the note author' 

      end

      context 'when the note author could not be found' do
        it 'imports the note with the project creator as the note author' 

      end
    end

    context 'when the noteable does not exist' do
      it 'does not import the note' 

    end

    context 'when the import fails due to a foreign key error' do
      it 'does not raise any errors' 

    end

    it 'produces a valid Note' 

  end

  describe '#find_noteable_id' do
    it 'returns the ID of the noteable' 

  end
end

