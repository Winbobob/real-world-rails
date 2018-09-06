require 'spec_helper'

describe Gitlab::GithubImport::Importer::DiffNotesImporter do
  let(:project) { double(:project, id: 4, import_source: 'foo/bar') }
  let(:client) { double(:client) }

  let(:github_comment) do
    double(
      :response,
      html_url: 'https://github.com/foo/bar/pull/42',
      path: 'README.md',
      commit_id: '123abc',
      diff_hunk: "@@ -1 +1 @@\n-Hello\n+Hello world",
      user: double(:user, id: 4, login: 'alice'),
      body: 'Hello world',
      created_at: Time.zone.now,
      updated_at: Time.zone.now,
      id: 1
    )
  end

  describe '#parallel?' do
    it 'returns true when running in parallel mode' 


    it 'returns false when running in sequential mode' 

  end

  describe '#execute' do
    context 'when running in parallel mode' do
      it 'imports diff notes in parallel' 

    end

    context 'when running in sequential mode' do
      it 'imports diff notes in sequence' 

    end
  end

  describe '#sequential_import' do
    it 'imports each diff note in sequence' 

  end

  describe '#parallel_import' do
    it 'imports each diff note in parallel' 

  end

  describe '#id_for_already_imported_cache' do
    it 'returns the ID of the given note' 

  end

  describe '#collection_options' do
    it 'returns an empty Hash' 

  end
end

