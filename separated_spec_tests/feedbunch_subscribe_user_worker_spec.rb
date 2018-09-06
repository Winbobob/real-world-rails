require 'rails_helper'

describe SubscribeUserWorker do

  before :each do
    @user = FactoryBot.create :user
    @folder = FactoryBot.build :folder, user_id: @user.id
    @user.folders << @folder
    @feed = FactoryBot.create :feed
    @url = 'http://www.galactanet.com/feed.xml'
    @job_state = FactoryBot.build :subscribe_job_state, user_id: @user.id, fetch_url: @feed.fetch_url
    @user.subscribe_job_states << @job_state

    # Stub FeedClient.stub so that it does not actually fetch feeds, but returns them untouched
    allow(FeedClient).to receive :fetch do |feed, args|
      feed
    end
  end

  it 'subscribes user to already existing feeds' 


  it 'creates new feeds and subscribes user to them' 


  it 'fetches new feeds' 


  context 'validations' do

    it 'does nothing if the user does not exist' 


    it 'destroys subscribe_job_state if the user does not exist' 


    it 'does nothing if job_state does not exist' 


    it 'does nothing if the job_state is not in state RUNNING' 


  end

  context 'updates job state' do

    it 'sets state to SUCCESS if job finishes successfully' 


    it 'saves feed id if job finishes successfully' 


    it 'sets state to ERROR if job finishes with an error' 


  end
end

