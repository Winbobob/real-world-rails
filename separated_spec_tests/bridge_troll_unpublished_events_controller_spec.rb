require 'rails_helper'

describe Events::UnpublishedEventsController do
  before do
    @event = create(:event, title: 'DonutBridge')
    @organizer = create(:user)
    @event.organizers << @organizer
  end

  describe "GET #index" do
    describe "visibility" do
      let!(:chapter) { create(:chapter) }
      let!(:pending_chapter_event) { create(:event, chapter: chapter, current_state: :pending_approval) }
      let!(:pending_other_event) { create(:event, current_state: :pending_approval) }
      let!(:draft_event) { create(:event, current_state: :draft) }
      let!(:published_event) { create(:event, current_state: :published) }

      context "as an admin/publisher" do
        before do
          sign_in create(:user, publisher: true)
        end

        it 'displays all events that are publishable' 

      end

      context "as a chapter leader" do
        before do
          leader = create(:user)
          chapter.leaders << leader
          sign_in leader
        end

        it 'displays events that are publishable for that chapter' 

      end
    end
  end

  describe "POST #publish" do
    def make_request
      post :publish, params: { unpublished_event_id: @event.id }
    end

    before do
      this_region = @event.region
      this_region.update_attributes(name: 'RailsBridge Shellmound')
      other_region = create(:region, name: 'RailsBridge Meriloft')

      @user_none = create(:user)

      @user_this_region = create(:user)
      @user_this_region.regions << this_region

      @user_no_email = create(:user, allow_event_email: false)
      @user_no_email.regions << this_region
      @event.organizers << @user_no_email

      @user_other_region = create(:user)
      @user_other_region.regions << other_region

      @user_both_regions = create(:user)
      @user_both_regions.regions << this_region
      @user_both_regions.regions << other_region

      sign_in create(:user, publisher: true)
    end

    def recipients(mail)
      JSON.parse(mail.header['X-SMTPAPI'].to_s)['to']
    end

    it 'publishes the event' 


    it 'mails every user that is associated with this region' 


    context 'if the announcement emails should be sent manually' do
      before do
        @event.update_attribute(:email_on_approval, false)
      end

      it 'lets the organizer know their event has been approved and does not send announcement emails' 

    end

    it 'updates the time the announcement email was sent' 


    context 'as a chapter leader' do
      before do
        chapter = create(:chapter)
        leader = create(:user)
        chapter.leaders << leader
        @chapter_event = create(:event, chapter: chapter, current_state: :pending_approval)
        @chapter_event.organizers << @organizer
        sign_in leader
      end

      it 'allows publishing of chapter events' 


      it 'disallows publishing of non-chapter events' 

    end
  end
end

