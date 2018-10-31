# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TrackMailer do

  describe 'when sending email alerts for tracked things' do

    before do
      mail_mock = double("mail")
      allow(mail_mock).to receive(:deliver_now)
      allow(TrackMailer).to receive(:event_digest).and_return(mail_mock)
      allow(Time).to receive(:now).and_return(Time.utc(2007, 11, 12, 23, 59))
      get_fixtures_xapian_index
    end

    it 'should ask for all the users whose last daily track email was sent more than a day ago' 


    describe 'for each user' do

      before do
        @user = mock_model(User, :no_xapian_reindex= => false,
                           :last_daily_track_email= => true,
                           :save! => true,
                           :url_name => 'test-name',
                           :get_locale => 'en',
                           :should_be_emailed? => true)
        klass = User::ActiveRecord_Relation
        allow_any_instance_of(klass).to receive(:find_each).and_yield(@user)
        allow(@user).to receive(:receive_email_alerts).and_return(true)
        allow(@user).to receive(:no_xapian_reindex=)
      end

      it 'should ask for any daily track things for the user' 



      it 'should set the no_xapian_reindex flag on the user' 


      it 'should update the time of the user\'s last daily tracking email' 

      it 'should return true' 



      describe 'for each tracked thing' do

        before do
          @track_things_sent_emails_array = []
          allow(@track_things_sent_emails_array).to receive(:where).and_return([]) # this is for the date range find (created in last 14 days)
          @track_thing = mock_model(TrackThing, :track_query => 'test query',
                                    :track_things_sent_emails => @track_things_sent_emails_array,
                                    :created_at => Time.utc(2007, 11, 9, 23, 59))
          allow(TrackThing).to receive(:where).and_return([@track_thing])
          @track_things_sent_email = mock_model(TrackThingsSentEmail, :save! => true,
                                                :track_thing_id= => true,
                                                :info_request_event_id= => true)
          allow(TrackThingsSentEmail).to receive(:new).and_return(@track_things_sent_email)
          @xapian_search = double('xapian search', :results => [])
          @found_event = mock_model(InfoRequestEvent, :described_at => @track_thing.created_at + 1.day)
          @search_result = {:model => @found_event}
          allow(ActsAsXapian::Search).to receive(:new).and_return(@xapian_search)
        end

        it 'should ask for the events returned by the tracking query' 


        it 'should not include in the email any events that the user has already been sent a tracking email about' 


        it 'should not include in the email any events not sent in a previous tracking email that were described before the track was set up' 


        it 'should include in the email any events that the user has not been sent a tracking email on that have been described since the track was set up' 


        it 'should raise an error if a non-event class is returned by the tracking query' 


        it 'should record that a tracking email has been sent for each event that
            has been included in the email' do
          allow(@xapian_search).to receive(:results).and_return([@search_result])
          sent_email = mock_model(TrackThingsSentEmail)
          expect(TrackThingsSentEmail).to receive(:new).and_return(sent_email)
          expect(sent_email).to receive(:track_thing_id=).with(@track_thing.id)
          expect(sent_email).to receive(:info_request_event_id=).with(@found_event.id)
          expect(sent_email).to receive(:save!)
          TrackMailer.alert_tracks
        end
      end

    end

    describe 'when a user should not be emailed' do
      before do
        @user = mock_model(User, :no_xapian_reindex= => false,
                           :last_daily_track_email= => true,
                           :save! => true,
                           :url_name => 'test-name',
                           :should_be_emailed? => false)
        klass = User::ActiveRecord_Relation
        allow_any_instance_of(klass).to receive(:find_each).and_yield(@user)
        allow(@user).to receive(:receive_email_alerts).and_return(true)
        allow(@user).to receive(:no_xapian_reindex=)
      end

      it 'should not ask for any daily track things for the user' 


      it 'should not ask for any daily track things for the user if they have receive_email_alerts off but could otherwise be emailed' 


      it 'should not set the no_xapian_reindex flag on the user' 


      it 'should not update the time of the user\'s last daily tracking email' 

      it 'should return false' 

    end

  end

  describe 'delivering the email' do

    before :each do
      allow(AlaveteliConfiguration).to receive(:site_name).
        and_return("L'information")
      @post_redirect = mock_model(PostRedirect, :save! => true,
                                  :email_token => "token")
      allow(PostRedirect).to receive(:new).and_return(@post_redirect)
      ActionMailer::Base.deliveries = []
      @user = mock_model(User,
                         :name_and_email => MailHandler.address_from_name_and_email('Tippy Test', 'tippy@localhost'),
                         :url_name => 'tippy_test'
                         )
      TrackMailer.event_digest(@user, []).deliver_now # no items in it email for minimal test
    end

    it 'should deliver one email, with right headers' 


    it "does not include HTMLEntities in the subject line" 


    it "does not alert about embargoed requests" 


    context "force ssl is off" do
      # Force SSL is off in the tests. Since the code that selectively switches the protocols
      # is in the initialiser for Rails it's hard to test. Hmmm...
      # We could AlaveteliConfiguration.stub(:force_ssl).and_return(true) but the config/environment.rb
      # wouldn't get reloaded

      it "should have http links in the email" 

    end
  end

end

