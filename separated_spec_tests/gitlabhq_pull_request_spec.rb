require 'spec_helper'

describe Gitlab::GithubImport::Representation::PullRequest do
  let(:created_at) { Time.new(2017, 1, 1, 12, 00) }
  let(:updated_at) { Time.new(2017, 1, 1, 12, 15) }
  let(:merged_at) { Time.new(2017, 1, 1, 12, 17) }

  shared_examples 'a PullRequest' do
    it 'returns an instance of PullRequest' 


    context 'the returned PullRequest' do
      it 'includes the pull request number' 


      it 'includes the pull request title' 


      it 'includes the pull request description' 


      it 'includes the source branch name' 


      it 'includes the source branch SHA' 


      it 'includes the target branch name' 


      it 'includes the target branch SHA' 


      it 'includes the milestone number' 


      it 'includes the user details' 


      it 'includes the assignee details' 


      it 'includes the created timestamp' 


      it 'includes the updated timestamp' 


      it 'includes the merged timestamp' 


      it 'includes the source repository ID' 


      it 'includes the target repository ID' 


      it 'includes the source repository owner name' 


      it 'includes the pull request state' 

    end
  end

  describe '.from_api_response' do
    let(:response) do
      double(
        :response,
        number: 42,
        title: 'My Pull Request',
        body: 'This is my pull request',
        state: 'closed',
        head: double(
          :head,
          sha: '123abc',
          ref: 'my-feature',
          repo: double(:repo, id: 400),
          user: double(:user, id: 4, login: 'alice')
        ),
        base: double(
          :base,
          sha: '456def',
          ref: 'master',
          repo: double(:repo, id: 200)
        ),
        milestone: double(:milestone, number: 4),
        user: double(:user, id: 4, login: 'alice'),
        assignee: double(:user, id: 4, login: 'alice'),
        created_at: created_at,
        updated_at: updated_at,
        merged_at: merged_at
      )
    end

    it_behaves_like 'a PullRequest' do
      let(:pr) { described_class.from_api_response(response) }
    end

    it 'does not set the user if the response did not include a user' 

  end

  describe '.from_json_hash' do
    it_behaves_like 'a PullRequest' do
      let(:hash) do
        {
          'iid' => 42,
          'title' => 'My Pull Request',
          'description' => 'This is my pull request',
          'source_branch' => 'my-feature',
          'source_branch_sha' => '123abc',
          'target_branch' => 'master',
          'target_branch_sha' => '456def',
          'source_repository_id' => 400,
          'target_repository_id' => 200,
          'source_repository_owner' => 'alice',
          'state' => 'closed',
          'milestone_number' => 4,
          'author' => { 'id' => 4, 'login' => 'alice' },
          'assignee' => { 'id' => 4, 'login' => 'alice' },
          'created_at' => created_at.to_s,
          'updated_at' => updated_at.to_s,
          'merged_at' => merged_at.to_s
        }
      end

      let(:pr) { described_class.from_json_hash(hash) }
    end

    it 'does not convert the author if it was not specified' 

  end

  describe '#state' do
    it 'returns :opened for an open pull request' 


    it 'returns :closed for a closed pull request' 


    it 'returns :merged for a merged pull request' 

  end

  describe '#cross_project?' do
    it 'returns false for a pull request submitted from the target project' 


    it 'returns true for a pull request submitted from a different project' 


    it 'returns true if no source repository is present' 

  end

  describe '#formatted_source_branch' do
    context 'for a cross-project pull request' do
      it 'includes the owner name in the branch name' 

    end

    context 'for a regular pull request' do
      it 'returns the source branch name' 

    end

    context 'for a pull request with the same source and target branches' do
      it 'returns a generated source branch name' 

    end
  end

  describe '#truncated_title' do
    it 'truncates the title to 255 characters' 


    it 'does not truncate the title if it is shorter than 255 characters' 

  end
end

