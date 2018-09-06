# frozen_string_literal: true

describe NotificationsHelper, type: :helper do
  include ApplicationHelper

  before do
    @user = FactoryGirl.create(:user)
    @person = FactoryGirl.create(:person)
    @post = FactoryGirl.create(:status_message, author: @user.person)
    @person2 = FactoryGirl.create(:person)
    Notifications::Liked.notify(FactoryGirl.create(:like, author: @person, target: @post), [])
    Notifications::Liked.notify(FactoryGirl.create(:like, author: @person2, target: @post), [])

    @notification = Notifications::Liked.find_by(target: @post, recipient: @user)
  end

  describe '#notification_people_link' do
    context 'formatting' do
      include ActionView::Helpers::SanitizeHelper
      let(:output){ strip_tags(notification_people_link(@note)) }

      before do
        @max = FactoryGirl.create(:person)
        @max.profile.first_name = 'max'
        @max.profile.last_name = 'salzberg'
        @sarah = FactoryGirl.create(:person)
        @sarah.profile.first_name = 'sarah'
        @sarah.profile.last_name = 'mei'


        @daniel = FactoryGirl.create(:person)
        @daniel.profile.first_name = 'daniel'
        @daniel.profile.last_name = 'grippi'

        @ilya = FactoryGirl.create(:person)
        @ilya.profile.first_name = 'ilya'
        @ilya.profile.last_name = 'zhit'
        @note = double()
      end

      it 'with two, does not comma seperate two actors' 


      it 'with three, comma seperates the first two, and and the last actor' 


      it 'with more than three, lists the first three, then the others tag' 

    end
    describe 'for a like' do
      it 'displays #{list of actors}' 

    end
  end

  describe '#object_link' do
    describe 'for a like' do
      it 'should include a link to the post' 


      it 'includes the boilerplate translation' 


      context 'when post is deleted' do
        it 'works' 


        it 'displays that the post was deleted' 

      end
    end

    let(:status_message) {
      FactoryGirl.create(:status_message_in_aspect, author: alice.person, text: text_mentioning(bob))
    }

    describe "when mentioned in status message" do
      it "should include correct wording and post link" 

    end

    describe "when mentioned in comment" do
      it "should include correct wording, post link and comment link" 

    end

    context "for a birthday" do
      let(:notification) { Notifications::ContactsBirthday.create(recipient: alice, target: bob.person) }

      it "contains the date" 


      it "doesn't break, when the person removes the birthday date" 

    end
  end

  describe '#display_year?' do
    it 'returns false if year is nil and the date includes the current year' 


    it 'returns true if year is nil and the date does not include the current year' 


    it 'returns false if the date includes the given year' 


    it 'returns true if the date does not include the given year' 

  end
end

