include ActionView::Helpers::DateHelper
include ActionView::Helpers::TextHelper

AVATAR_COMPONENT_NAME = 'Avatar';

RSpec::Matchers.define :be_avatar_component do
  match do
    have_tag('script', with: { 'data-component-name': AVATAR_COMPONENT_NAME })
  end
end

describe ApplicationController do
  describe "most_focus" do
    describe "categories" do
      it "returns an empty hash because no categories exist" 


      describe "returns a hash because categories exist" do
        it "returns a hash of size 1 when the same category is used twice" 


        it "returns a hash of size 2" 


        it "returns a correct hash of size 3" 


        it "returns a correct hash of size 1 belonging to another user" 


        it "returns a correct hash of size 0 belonging to another user when his/her posts are drafts" 

      end
    end

    describe "moods" do
      it "returns an empty hash because no moods exist" 


      describe "returns a hash because moods exist" do
        it "returns a hash of size 1 when the same mood is used twice" 


        it "returns a hash of size 2" 


        it "returns a correct hash of size 3" 


        it "returns a correct hash of size 1 belonging to another user" 


        it "returns a correct hash of size 0 belonging to another user when all his/her posts are drafts" 

      end
    end

    describe "strategy" do
      it "returns an empty hash because no strategies exist" 


      describe "returns a hash because strategies exist" do
        it "returns a hash of size 1 when the same strategy is used twice" 


        it "returns a hash of size 2" 


        it "returns a correct hash of size 3" 


        it "returns a correct hash of size 1 belonging to another user" 


        it "returns a correct hash of size 0 belonging to another user when all his/her posts are drafts" 

      end
    end
  end

  describe "tag_usage" do
    it "is looking for categories tagged nowhere" 


    it "is looking for categories tagged in moments and strategies" 


    it "is looking for moods tagged nowhere" 


    it "is looking for moods tagged in moments" 


    it "is looking for strategies tagged nowhere" 


    it "is looking for strategies tagged in moments" 

  end

  describe "get_stories" do
    it "has no stories and does not include allies" 


    it "has only moments and does not include allies" 


    it "has only strategies and does not include allies" 


    it "has both moments and strategies, and does not include allies" 


    it "has no stories and does include allies" 


    it "has only moments and does include allies" 


    it "has only other users' draft moments and does include allies" 


    it "has only strategies and does include allies" 


    it "has only other users' draft strategies and does include allies" 


    it "has both moments and strategies, and does include allies" 


    it "has only users' draft moments and strategies, and does include allies" 


    it "has no moments and strategies despite being allies with user" 


    it "has both moments and strategies and is allies with user" 


    it "has both moments and strategies and is allies with user, but her/his posts are all drafts" 

  end

  describe "moments_stats" do
    it "has no moments" 


    it "has one moment" 


    it "has more than one moment created this month" 


    it "has more than one moment created on different months" 

  end

  describe 'generate_comment' do
    let(:user1) { create(:user1) }
    let(:user2) { create(:user2) }
    let(:user3) { create(:user3) }
    let(:comment) { 'Hello from the outside'}

    def delete_comment(comment_id)
      %(<div class="table_cell delete_comment"><a id="delete_comment_#{comment_id}" class="delete_comment_button" href=""><i class="fa fa-times"></i></a></div>)
    end

    def comment_info(user)
      %(<a href="/profile?uid=#{controller.get_uid(user.id)}">#{user.name}</a> - less than a minute ago)
    end

    before do
      create(:allyships_accepted, user_id: user1.id, ally_id: user2.id)
      create(:allyships_accepted, user_id: user1.id, ally_id: user3.id)
    end

    context 'Moments' do
      let(:new_moment) { create(:moment, userid: user1.id, viewers: [user2.id, user3.id]) }

      context 'Comment posted by Moment creator who is logged in' do
        before(:each) do
          sign_in user1
        end

        it 'generates a valid comment object when visbility is all' 


        it 'generates a valid comment object when visbility is private' 

      end

      context 'Comment posted by Moment viewer who is logged in' do
        before(:each) do
          sign_in user2
        end

        it 'generates a valid comment object when visbility is all' 


        it 'generates a valid comment object when visbility is private' 

      end
    end

    context 'Strategies' do
      let(:new_strategy) { create(:strategy, userid: user1.id, viewers: [user2.id, user3.id]) }

      context 'Comment posted by Strategy creator who is logged in' do
        before(:each) do
          sign_in user1
        end

        it 'generates a valid comment object when visbility is all' 


        it 'generates a valid comment object when visbility is private' 

      end

      context 'Comment posted by Strategy viewer who is logged in' do
        before(:each) do
          sign_in user2
        end

        it 'generates a valid comment object when visbility is all' 


        it 'generates a valid comment object when visbility is private' 

      end
    end

    context 'Meetings' do
      let(:new_meeting) { create :meeting }

      before do
        create :meeting_member, userid: user1.id, leader: true, meetingid: new_meeting.id
        create :meeting_member, userid: user2.id, leader: false, meetingid: new_meeting.id
      end

      context 'Comment posted by Meeting creator who is logged in' do
        it 'generates a valid comment object' 

      end

      context 'Comment posted by Meeting member who is logged in' do
        it 'generates a valid comment object' 

      end
    end
  end
end

