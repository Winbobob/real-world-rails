require 'spec_helper'

describe Gitlab::GithubImport::Representation::Note do
  let(:created_at) { Time.new(2017, 1, 1, 12, 00) }
  let(:updated_at) { Time.new(2017, 1, 1, 12, 15) }

  shared_examples 'a Note' do
    it 'returns an instance of Note' 


    context 'the returned Note' do
      it 'includes the noteable ID' 


      it 'includes the noteable type' 


      it 'includes the author details' 


      it 'includes the note body' 


      it 'includes the created timestamp' 


      it 'includes the updated timestamp' 


      it 'includes the GitHub ID' 

    end
  end

  describe '.from_api_response' do
    let(:response) do
      double(
        :response,
        html_url: 'https://github.com/foo/bar/issues/42',
        user: double(:user, id: 4, login: 'alice'),
        body: 'Hello world',
        created_at: created_at,
        updated_at: updated_at,
        id: 1
      )
    end

    it_behaves_like 'a Note' do
      let(:note) { described_class.from_api_response(response) }
    end

    it 'does not set the user if the response did not include a user' 

  end

  describe '.from_json_hash' do
    it_behaves_like 'a Note' do
      let(:hash) do
        {
          'noteable_id' => 42,
          'noteable_type' => 'Issue',
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
end

