require 'rails_helper'

describe EmailActionsController do
  describe "unfollow_discussion" do
    before do
      @user = FactoryBot.create(:user)
      @group = FactoryBot.create(:formal_group)
      @group.add_member!(@user)

      @discussion = FactoryBot.build(:discussion, group: @group)
      DiscussionService.create(discussion: @discussion, actor: @user)
      DiscussionReader.for(discussion: @discussion, user: @user).set_volume! :loud
    end

    it 'stops email notifications for the discussion' 

  end

  describe "follow_discussion" do
    before do
      @user = FactoryBot.create(:user)
      @group = FactoryBot.create(:formal_group)
      @group.add_member!(@user)

      @discussion = FactoryBot.build(:discussion, group: @group)
      DiscussionService.create(discussion: @discussion, actor: @user)
      DiscussionReader.for(discussion: @discussion, user: @user).set_volume! :normal
    end

    xit 'enables emails for the discussion' do
      get :follow_discussion, params: { discussion_id: @discussion.id, unsubscribe_token: @user.unsubscribe_token }
      expect(DiscussionReader.for(discussion: @discussion, user: @user).volume).to eq 'loud'
    end
  end

  describe "mark_discussion_as_read" do
    before do
      @user = FactoryBot.create(:user)
      @author = FactoryBot.create(:user)
      @group = FactoryBot.create(:formal_group)
      @group.add_member!(@user)
      @group.add_member!(@author)

      @discussion = FactoryBot.build(:discussion, group: @group)
      @event = DiscussionService.create(discussion: @discussion, actor: @author)
    end

    it 'marks the discussion as read at event created_at' 


    it 'does not error when discussion is not found' 


    it 'marks a comment as read' 

  end

  describe 'mark_summary_email_as_read' do
    it 'marks content as read' 

  end

end

