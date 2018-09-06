require 'rails_helper'

describe UsersController do
  before do
    @logged_in_user = create(:user)
    sign_in @logged_in_user
  end

  describe "index" do
    before do
      @user1 = create(:meetup_user, full_name: 'Major MeetupUser')
      @user2 = create(:meetup_user)
      @user_no_rsvps = create(:meetup_user)

      @user_associated = create(:meetup_user)
      @bridgetroll_user = create(:user, first_name: 'Baroque', last_name: 'BridgetrollUser')

      @event1 = create(:event)
      @event2 = create(:event)

      @event1.rsvps << create(:rsvp, user: @user_associated, event: @event1)
      @bridgetroll_user.authentications.create(provider: 'meetup', uid: @user_associated.meetup_id.to_s)

      @event1.rsvps << create(:rsvp, user: @user1, event: @event1)
      @event2.rsvps << create(:rsvp, user: @user1, event: @event2)

      @event1.rsvps << create(:rsvp, user: @user2, event: @event1)
    end

    it "shows a bunch of user names" 


    it "calculates attendances" 


    describe "searching" do
      let(:ids_from_json) do
        Proc.new do |response|
          JSON.parse(response.body)['data'].map { |u| u['global_id'] }
        end
      end

      it "filters by search query" 

    end
  end
end

