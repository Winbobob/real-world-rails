require 'rails_helper'

describe UnsubscribeUserWorker do

  before :each do
    @user = FactoryBot.create :user
    @feed = FactoryBot.create :feed
    @user.subscribe @feed.fetch_url
  end

  it 'unsubscribes user from feed' 


  context 'validations' do

    it 'does nothing if the user does not exist' 


    it 'does nothing if the feed does not exist' 


    it 'does nothing if the feed is not subscribed by the user' 


  end
end

