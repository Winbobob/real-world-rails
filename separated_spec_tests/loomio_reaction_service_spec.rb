require 'rails_helper'

describe ReactionService do
  let(:user) { create :user }
  let(:another_user) { create :user }
  let(:reaction) { build :reaction, reaction: ":heart:", reactable: comment, user: user }
  let(:group) { create :formal_group }
  let(:discussion) { create :discussion, group: group }
  let(:comment) { create :comment, discussion: discussion, author: user }

  before do
    group.add_member! user
    group.add_member! another_user
  end

  describe 'update' do
    it 'creates a like for the current user on a comment' 


    it 'does not notify if the user is no longer in the group' 

  end

  describe 'destroy' do
    before { reaction.save }

    it 'removes a like for the current user on a comment' 


    it 'does not allow others to destroy a reaction' 

  end
end

