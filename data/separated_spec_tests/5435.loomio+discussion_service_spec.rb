require 'rails_helper'

describe 'DiscussionService' do
  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:admin) { create(:user) }
  let(:group) { create(:formal_group) }
  let(:another_group) { create(:formal_group, is_visible_to_public: false) }
  let(:discussion) { create(:discussion, author: user, group: group) }
  let(:poll) { create(:poll, discussion: discussion, group: group) }
  let(:comment) { double(:comment,
                         save!: true,
                         valid?: true,
                         'author=' => nil,
                         created_at: :a_time,
                         discussion: discussion,
                         destroy: true,
                         author: user) }
  let(:document) { create(:document) }
  let(:discussion_params) { {title: "new title", description: "new description", private: true} }

  describe 'create' do
    it 'authorizes the user can create the discussion' 


    it 'clears out the draft' 


    it 'does not email people' 


    context 'the discussion is valid' do
      before { discussion.stub(:valid?).and_return(true) }

      it 'syncs the discussion search vector' 


      it 'notifies new mentions' 


      it 'does not notify users outside the group' 


      it 'sets the volume to loud if the user has set email_on_participation' 


      it 'does not set the volume if the user has not set email_on_participation' 


      it 'fires a NewDiscussion event' 


      it 'returns the event created' 

    end
  end

  describe 'update' do
    it 'authorizes the user can update the discussion' 


    it 'notifies new mentions' 


    it 'notifies new mentions with edit' 


    it 'does not renotify old mentions' 


    it 'notifies users outside of the group' 


    it 'sets params' 


    context 'the discussion is valid' do
      before { discussion.stub(:valid?).and_return(true) }

      it 'updates user markdown-preference' 


      it 'publishes a discussion edited event' 


      it 'syncs the discussion search vector' 


      it 'creates a version with updated title / description / private values' 


      it 'creates a version with updated document_ids' 


      it 'updates the existing version with document_ids' 


      it 'removes documents in the version' 

    end

    context 'the discussion is invalid' do
      before { discussion.stub(:valid?).and_return(false) }
      it 'returns false' 

    end
  end

  describe 'update_reader' do
    context 'success' do
      it 'can save reader attributes' 

    end

    it 'does not update if the user cannot update the reader' 

  end

  describe 'move' do
    it 'can move a discussion to another group the user is a member of' 


    it 'updates the privacy for private discussion only groups' 


    it 'updates the privacy for public discussion only groups' 


    it 'can move a discussion the user is author of' 


    it 'does not update other discussion attributes' 


    it 'does not move a discussion the user cannot move' 


    it 'does not move a discussion to a group the user is not a member of' 


    it 'updates the group for any polls in the discussion' 

  end

  describe 'destroy' do

    it 'checks the actor has permission' 


    context 'actor is permitted' do
      it 'deletes the discussion' 

    end

    context 'actor is not permitted' do
      it 'does not delete the discussion' 

    end
  end
end

