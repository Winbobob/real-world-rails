require 'spec_helper'

describe PushEventPayloadService do
  let(:event) { create(:push_event) }

  describe '#execute' do
    let(:push_data) do
      {
        commits: [
          {
            id: '1cf19a015df3523caf0a1f9d40c98a267d6a2fc2',
            message: 'This is a commit'
          }
        ],
        before: '0000000000000000000000000000000000000000',
        after: '1cf19a015df3523caf0a1f9d40c98a267d6a2fc2',
        total_commits_count: 1,
        ref: 'refs/heads/my-branch'
      }
    end

    it 'creates a new PushEventPayload row' 


    it 'sets the push_event_payload association of the used event' 

  end

  describe '#commit_title' do
    it 'returns nil if no commits were pushed' 


    it 'returns a String limited to 70 characters' 


    it 'does not truncate the commit message if it is shorter than 70 characters' 


    it 'includes the first line of a commit message if the message spans multiple lines' 

  end

  describe '#commit_from_id' do
    it 'returns nil when creating a new ref' 


    it 'returns the ID of the first commit when pushing to an existing ref' 

  end

  describe '#commit_to_id' do
    it 'returns nil when removing an existing ref' 

  end

  describe '#commit_count' do
    it 'returns the number of commits' 


    it 'raises when the push data does not contain the commits count' 

  end

  describe '#ref' do
    it 'returns the name of the ref' 


    it 'raises when the push data does not contain the ref name' 

  end

  describe '#revision_before' do
    it 'returns the revision from before the push' 


    it 'raises when the push data does not contain the before revision' 

  end

  describe '#revision_after' do
    it 'returns the revision from after the push' 


    it 'raises when the push data does not contain the after revision' 

  end

  describe '#trimmed_ref' do
    it 'returns the ref name without its prefix' 

  end

  describe '#create?' do
    it 'returns true when creating a new ref' 


    it 'returns false when pushing to an existing ref' 

  end

  describe '#remove?' do
    it 'returns true when removing an existing ref' 


    it 'returns false pushing to an existing ref' 

  end

  describe '#action' do
    it 'returns :created when creating a ref' 


    it 'returns :removed when removing an existing ref' 


    it 'returns :pushed when pushing to an existing ref' 

  end

  describe '#ref_type' do
    it 'returns :tag for a tag' 


    it 'returns :branch for a branch' 

  end
end

