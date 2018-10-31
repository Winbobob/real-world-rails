require 'spec_helper'

describe Gitlab::GithubImport::Representation::DiffNote do
  let(:hunk) do
    '@@ -1 +1 @@
    -Hello
    +Hello world'
  end

  let(:created_at) { Time.new(2017, 1, 1, 12, 00) }
  let(:updated_at) { Time.new(2017, 1, 1, 12, 15) }

  shared_examples 'a DiffNote' do
    it 'returns an instance of DiffNote' 


    context 'the returned DiffNote' do
      it 'includes the number of the note' 


      it 'includes the file path of the diff' 


      it 'includes the commit ID' 


      it 'includes the user details' 


      it 'includes the note body' 


      it 'includes the created timestamp' 


      it 'includes the updated timestamp' 


      it 'includes the GitHub ID' 


      it 'returns the noteable type' 

    end
  end

  describe '.from_api_response' do
    let(:response) do
      double(
        :response,
        html_url: 'https://github.com/foo/bar/pull/42',
        path: 'README.md',
        commit_id: '123abc',
        diff_hunk: hunk,
        user: double(:user, id: 4, login: 'alice'),
        body: 'Hello world',
        created_at: created_at,
        updated_at: updated_at,
        id: 1
      )
    end

    it_behaves_like 'a DiffNote' do
      let(:note) { described_class.from_api_response(response) }
    end

    it 'does not set the user if the response did not include a user' 

  end

  describe '.from_json_hash' do
    it_behaves_like 'a DiffNote' do
      let(:hash) do
        {
          'noteable_type' => 'MergeRequest',
          'noteable_id' => 42,
          'file_path' => 'README.md',
          'commit_id' => '123abc',
          'diff_hunk' => hunk,
          'author' => { 'id' => 4, 'login' => 'alice' },
          'note' => 'Hello world',
          'created_at' => created_at.to_s,
          'updated_at' => updated_at.to_s,
          'github_id' => 1
        }
      end

      let(:note) { described_class.from_json_hash(hash) }
    end

    it 'does not convert the author if it was not specified' 

  end

  describe '#line_code' do
    it 'returns a String' 

  end

  describe '#diff_hash' do
    it 'returns a Hash containing the diff details' 

  end
end

