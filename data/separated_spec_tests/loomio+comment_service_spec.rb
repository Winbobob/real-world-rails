require 'rails_helper'
describe 'CommentService' do
  let(:user) { create :user }
  let(:another_user) { create :user }
  let(:group) { create(:formal_group) }
  let(:discussion) { create :discussion, group: group, author: user }
  let(:comment) { create :comment, discussion: discussion, author: user }
  let(:reaction) { create :reaction, reactable: comment, user: user }
  let(:reader) { DiscussionReader.for(user: user, discussion: discussion) }
  let(:comment_params) {{ body: 'My body is ready' }}

  before do
    group.add_member! another_user
  end

  describe 'destroy' do

    it 'checks the actor has permission' 


    it 'deletes the comment' 


    it 'nullifies the parent_id of replies' 

  end

  describe 'create' do

    it 'authorizes that the user can add the comment' 


    it 'sets my volume to loud' 


    it 'saves the comment' 


    it 'clears out the draft' 


    context 'comment is valid' do
      before do
        comment.stub(:valid?).and_return(true)
      end

      it 'fires a NewComment event' 


      it 'returns the event created' 


      it 'updates the discussion reader' 


      it 'publishes a comment replied to event if there is a parent' 


      it 'does not publish a comment replied to event if there is no parent' 


      it 'does not send any notifications if the author is the same as the replyee' 


      it 'does not notify the parent author even if mentioned' 

    end

    context 'comment is invalid' do
      before do
        comment.stub(:valid?).and_return(false)
      end

      it 'returns false' 


      it 'does not create new comment event' 


      it 'does not update discussion' 

    end
  end

  describe 'update' do
    it 'updates a comment' 


    it 'does not renotify old mentions' 


    it 'does not update an invalid comment' 

  end
end

