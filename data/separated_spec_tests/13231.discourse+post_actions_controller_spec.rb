require 'rails_helper'

RSpec.describe PostActionsController do
  describe '#destroy' do
    let(:post) { Fabricate(:post, user: Fabricate(:coding_horror)) }

    it 'requires you to be logged in' 


    context 'logged in' do
      let(:user) { Fabricate(:user) }

      before do
        sign_in(user)
      end

      it 'raises an error when the post_action_type_id is missing' 


      it "returns 404 when the post action type doesn't exist for that user" 


      context 'with a post_action record ' do
        let!(:post_action) do
          PostAction.create!(
            user_id: user.id,
            post_id: post.id,
            post_action_type_id: PostActionType.types[:bookmark]
          )
        end

        it 'returns success' 


        it 'deletes the action' 


        it "isn't deleted when the user doesn't have permission" 

      end
    end
  end

  describe '#create' do
    it 'requires you to be logged in' 


    it 'fails when the user does not have permission to see the post' 


    it 'fails when the user tries to notify user that has disabled PM' 


    describe 'as a moderator' do
      let(:user) { Fabricate(:moderator) }
      let(:post_1) { Fabricate(:post, user: Fabricate(:coding_horror)) }

      before do
        sign_in(user)
      end

      it 'raises an error when the id is missing' 


      it 'fails when the id is invalid' 


      it 'raises an error when the post_action_type_id index is missing' 


      it "fails when the user doesn't have permission to see the post" 


      it 'allows us to create an post action on a post' 


      it "passes a list of taken actions through" 


      it 'passes the message through' 


      it 'passes the message through as warning' 


      it "doesn't create message as a warning if the user isn't staff" 


      it 'passes take_action through' 


      it "doesn't pass take_action through if the user isn't staff" 

    end
  end

  describe '#defer_flags' do
    let!(:flag) do
      PostAction.create!(
        post_id: flagged_post.id,
        user_id: Fabricate(:user).id,
        post_action_type_id: PostActionType.types[:spam]
      )
    end
    let(:flagged_post) { Fabricate(:post, user: Fabricate(:coding_horror)) }

    context "not logged in" do
      it "should not allow them to clear flags" 

    end

    context 'logged in' do
      let!(:user) { sign_in(Fabricate(:moderator)) }

      it "raises an error without a post_action_type_id" 


      it "raises an error when the user doesn't have access" 


      context "success" do
        it "delegates to defer_flags" 


        it "works with a deleted post" 

      end
    end
  end
end

