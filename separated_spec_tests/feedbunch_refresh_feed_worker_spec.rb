require 'rails_helper'

describe RefreshFeedWorker do

  before :each do
    @user = FactoryBot.create :user
    @feed = FactoryBot.create :feed
    @user.subscribe @feed.fetch_url
    @refresh_feed_job_state = FactoryBot.create :refresh_feed_job_state, user_id: @user.id, feed_id: @feed.id
    allow(FeedClient).to receive :fetch
  end

  it 'updates feed when the job runs' 


  it 'recalculates unread entries count in feed' 


  context 'validations' do

    it 'updates feed even if the refresh_feed_job_state does not exist' 


    it 'does not update feed if the user does not exist' 


    it 'destroys refresh_feed_job_state if the user does not exist' 


    it 'does not update feed if it does not exist' 


    it 'destroys refresh_feed_job_state if the feed does not exist' 



    it 'does not update feed if the user is not subscribed' 


    it 'destroys refresh_feed_job_state if the user is not subscribed' 

  end

  context 'update refresh_feed_job_state' do

    it 'does not update feed if refresh_feed_job_state is not RUNNING' 


    it 'updates refresh_feed_job_state to SUCCESS if successful' 


    it 'updates refresh_feed_job_state to ERROR if an error is raised when fetching feed' 

  end

  context 'failing feed' do

    it 'sets failing_since to nil when an update runs successfully' 


    it 'sets available to true when an update runs successfully' 


    it 'does not change failing_since if the feed update fails' 


    it 'does not mark feed as available when the feed update fails' 

  end

end

