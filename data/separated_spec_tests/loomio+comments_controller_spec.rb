require 'rails_helper'
describe API::CommentsController do

  let(:user) { create :user }
  let(:another_user) { create :user }
  let(:group) { create :formal_group }
  let(:discussion) { create :discussion, group: group }
  let(:comment) { create :comment, discussion: discussion, author: user }
  let(:another_comment) { create :comment, discussion: discussion, author: another_user }

  before do
    group.add_member! user
  end

  describe "signed in" do
    before do
      sign_in user
    end

    describe 'update' do
      let(:comment_params) { {body: 'updated content'} }

      context 'success' do
        it "updates a comment" 

      end

      context 'failures' do
        it "responds with an error when there are unpermitted params" 


        it "responds with an error when the user is unauthorized" 


        it "responds with validation errors when they exist" 

      end
    end

    describe 'create' do
      let(:comment_params) { {discussion_id: discussion.id,
                              body: 'original content'} }

      context 'success' do
        it "creates a comment" 


        it 'allows guest group members to comment' 


        it 'responds with a discussion with a reader' 


        it 'responds with json' 


        describe 'mentioning' do
          it 'mentions appropriate users' 


          it 'invites non-members to the discussion' 

        end
      end

      context 'failures' do
        it "responds with an error when there are unpermitted params" 


        it "responds with an error when the user is unauthorized" 


        it "responds with validation errors when they exist" 

      end
    end

    describe 'destroy' do
      context 'allowed to delete' do
        it "destroys a comment" 

      end

      context 'not allowed to delete' do
        it "gives error of some kind" 

      end
    end
  end
end

