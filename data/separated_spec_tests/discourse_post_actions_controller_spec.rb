require 'rails_helper'

describe PostActionsController do

  describe 'create' do

    context 'logged in as user' do
      let(:user) { Fabricate(:user) }
      let(:private_message) { Fabricate(:private_message_post, user: Fabricate(:coding_horror)) }

      before do
        log_in_user(user)
      end

      it 'fails when the user does not have permission to see the post' 

    end
  end

  context 'destroy' do

    let(:post) { Fabricate(:post, user: Fabricate(:coding_horror)) }

    context 'logged in' do
      let!(:user) { log_in }

      it 'raises an error when the post_action_type_id is missing' 


      it "returns 404 when the post action type doesn't exist for that user" 


      context 'with a post_action record ' do
        let!(:post_action) { PostAction.create(user_id: user.id, post_id: post.id, post_action_type_id: 1) }

        it 'returns success' 


        it 'deletes the action' 


        it 'ensures it can be deleted' 

      end

    end

  end

  context 'defer_flags' do

    let(:flagged_post) { Fabricate(:post, user: Fabricate(:coding_horror)) }

    context "not logged in" do
      it "should not allow them to clear flags" 

    end

    context 'logged in' do
      let!(:user) { log_in(:moderator) }

      it "raises an error without a post_action_type_id" 


      it "raises an error when the user doesn't have access" 


      context "success" do
        before do
          Guardian.any_instance.expects(:can_defer_flags?).returns(true)
          PostAction.expects(:defer_flags!).with(flagged_post, user)
        end

        it "delegates to defer_flags" 


        it "works with a deleted post" 


      end

    end

  end

end

