require 'rails_helper'

describe Queries::VisibleDiscussions do
  let(:user) { create :user }
  let(:group) { create :formal_group, discussion_privacy_options: 'public_or_private' }
  let(:author) { create :user }
  let(:discussion) { create :discussion, group: group, author: author, private: true }

  subject do
    Queries::VisibleDiscussions.new(user: user, group_ids: [group.id])
  end

  describe 'sorted_by_importance' do
    let(:group) { create(:formal_group, is_visible_to_public: true) }
    let!(:no_importance) { create :discussion, private: false, group: group }
    let!(:has_decision)  { create :discussion, private: false, group: group, polls: [create(:poll)] }
    let!(:pinned)        { create :discussion, private: false, group: group, pinned: true }

    it 'orders discussions by importance when logged out' 


    it 'orders discussions by reader importance when logged in' 

  end

  describe 'logged out' do
    let(:logged_out_user) { LoggedOutUser.new }
    let!(:public_discussion) { create(:discussion, private: false, group: create(:formal_group, is_visible_to_public: true)) }
    let!(:another_public_discussion) { create(:discussion, private: false, group: create(:formal_group, is_visible_to_public: true)) }
    let!(:private_discussion) { create(:discussion, group: create(:formal_group, is_visible_to_public: false)) }

    it 'shows groups visible to public if no groups are specified' 


    it 'shows specified groups if they are public' 


    it 'shows nothing if no public groups are specified' 

  end

  describe 'unread' do
    before do
      group.add_member! author
      group.add_member! user
      #group.add_member! uses
      #comment = FactoryBot.build(:comment, discussion: discussion, author: discussion.author)
      #CommentService.create(comment: comment, actor: discussion.author)
    end

    it 'unread discussions with no comments' 


    it 'does not include dismissed discussions' 

  end

  describe 'discussion privacy' do
    context 'private' do
      before { discussion.update_attribute(:private, true) }

      it 'guests cannot see discussion' 


      it 'members can see discussion' 

    end

    context 'not private' do
      before { discussion.update_attribute(:private, false) }
      it 'guests can see discussion' 


      it 'members can see discussion' 

    end

  end

  describe 'group privacy' do
    context 'public discussions allowed' do
      before do
        group.update_attribute(:discussion_privacy_options, 'public_or_private')
        discussion.update_attribute(:private, false)
      end

      it 'guests can see discussions' 


      it 'members can see discussions' 

    end

    context 'private discussions only' do
      before do
        group.update_attribute(:discussion_privacy_options, 'private_only')
        discussion.update_attribute(:private, true)
      end

      it 'guests cannot see discussions' 


      it 'members can see discussions' 

    end

    context 'parent_members_can_see_discussions' do
      let(:parent_group) { create :formal_group, group_privacy: 'secret'}
      let(:group) { create :formal_group,
                           parent: parent_group,
                           parent_members_can_see_discussions: true,
                           is_visible_to_public: false,
                           is_visible_to_parent_members: true,
                           discussion_privacy_options: 'private_only' }

      before do
        discussion.update_attribute(:private, true)
      end

      it 'non members cannot see discussions' 


      it 'member of parent group can see discussions' 

    end

    context 'only members can see discussions' do
      let(:parent_group) { create :formal_group }
      let(:group) { create :formal_group,
                           parent: parent_group,
                           parent_members_can_see_discussions: false,
                           is_visible_to_parent_members: true }

      it 'prevents parent group members from seeing discussions' 

    end
  end

  describe 'archived' do
    it 'does not return discussions in archived groups' 

  end
end

