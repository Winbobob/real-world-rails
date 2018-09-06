require 'rails_helper'

describe ResetDemoUserWorker do

  before :each do
    @demo_email = Feedbunch::Application.config.demo_email
    @demo_password = Feedbunch::Application.config.demo_password
  end

  context 'demo user disabled' do

    before :each do
      Feedbunch::Application.config.demo_enabled = false
    end

    it 'does not create demo user' 


    it 'destroys demo user if it exists' 

  end

  context 'demo user enabled' do

    before :each do
      Feedbunch::Application.config.demo_enabled = true

      allow_any_instance_of(User).to receive :subscribe do |user, url|
        if Feed.exists? fetch_url: url
          feed = Feed.find_by fetch_url: url
        else
          feed = FactoryBot.create :feed, fetch_url: url
        end
        subscription = FactoryBot.build :feed_subscription,
                                         user_id: user.id,
                                         feed_id: feed.id
        user.feed_subscriptions << subscription
        feed
      end
    end

    it 'creates demo user if it does not exist' 


    it 'does not alter demo user if it exists' 


    context 'reset demo user' do

      before :each do
        @demo_user = FactoryBot.create :user, email: @demo_email, password: @demo_password
      end

      it 'resets admin to false' 


      it 'resets locale to default' 


      it 'resets timezone to default' 


      it 'resets quick_reading to default' 


      it 'resets open_all_entries to default' 


      it 'resets name to default' 


      it 'resets invitation limit to zero' 


      it 'resets all tours' 


      it 'resets free to true' 


      it 'resets OPML import state to NONE' 


      it 'resets OPML export state to NONE' 


      it 'destroys subscribe job states' 


      it 'destroys refresh job states' 


      context 'reset feeds and folders' do

        it 'resets folders' 


        it 'resets feeds' 


        it 'follows redirections in default feeds' 

      end

      context 'reset entries' do
        
        before :each do
          default_subscriptions = Feedbunch::Application.config.demo_subscriptions
          
          # There are two read entries in one of the demo feeds
          @demo_feed_url = default_subscriptions.values.flatten.first
          @demo_feed = FactoryBot.create :feed, fetch_url: @demo_feed_url

          @entry_1 = FactoryBot.build :entry, feed_id: @demo_feed.id
          @entry_2 = FactoryBot.build :entry, feed_id: @demo_feed.id
          @demo_feed.entries << @entry_1 << @entry_2
          @demo_user.subscribe @demo_feed.fetch_url
          @demo_user.change_entries_state @entry_1, 'read'
          @demo_user.change_entries_state @entry_2, 'read'
        end

        it 'marks all entries as unread' 


        it 'sets correct unread count in subscriptions' 

      end
    end
  end

end

