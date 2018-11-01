require 'spec_helper'

describe Gitlab::GithubImport::Representation::Issue do
  let(:created_at) { Time.new(2017, 1, 1, 12, 00) }
  let(:updated_at) { Time.new(2017, 1, 1, 12, 15) }

  shared_examples 'an Issue' do
    it 'returns an instance of Issue' 


    context 'the returned Issue' do
      it 'includes the issue number' 


      it 'includes the issue title' 


      it 'includes the issue description' 


      it 'includes the milestone number' 


      it 'includes the issue state' 


      it 'includes the issue assignees' 


      it 'includes the label names' 


      it 'includes the author details' 


      it 'includes the created timestamp' 


      it 'includes the updated timestamp' 


      it 'is not a pull request' 

    end
  end

  describe '.from_api_response' do
    let(:response) do
      double(
        :response,
        number: 42,
        title: 'My Issue',
        body: 'This is my issue',
        milestone: double(:milestone, number: 4),
        state: 'open',
        assignees: [double(:user, id: 4, login: 'alice')],
        labels: [double(:label, name: 'bug')],
        user: double(:user, id: 4, login: 'alice'),
        created_at: created_at,
        updated_at: updated_at,
        pull_request: false
      )
    end

    it_behaves_like 'an Issue' do
      let(:issue) { described_class.from_api_response(response) }
    end

    it 'does not set the user if the response did not include a user' 

  end

  describe '.from_json_hash' do
    it_behaves_like 'an Issue' do
      let(:hash) do
        {
          'iid' => 42,
          'title' => 'My Issue',
          'description' => 'This is my issue',
          'milestone_number' => 4,
          'state' => 'opened',
          'assignees' => [{ 'id' => 4, 'login' => 'alice' }],
          'label_names' => %w[bug],
          'author' => { 'id' => 4, 'login' => 'alice' },
          'created_at' => created_at.to_s,
          'updated_at' => updated_at.to_s,
          'pull_request' => false
        }
      end

      let(:issue) { described_class.from_json_hash(hash) }
    end

    it 'does not convert the author if it was not specified' 

  end

  describe '#labels?' do
    it 'returns true when the issue has labels assigned' 


    it 'returns false when the issue has no labels assigned' 

  end

  describe '#pull_request?' do
    it 'returns false for an issue' 


    it 'returns true for a pull request' 

  end

  describe '#truncated_title' do
    it 'truncates the title to 255 characters' 


    it 'does not truncate the title if it is shorter than 255 characters' 

  end
end

