require 'spec_helper'

describe Admin::TweetsController do
  let(:subject) { FactoryGirl.create(:tweet) }
  let(:user) { FactoryGirl.create(:admin) }
  before { set_current_user(user) }

  describe 'index' do
    it 'renders' 

  end

  describe 'edit' do
    it 'renders' 

  end

  describe 'new' do
    it 'renders' 

  end

  describe 'create' do
    xit 'gets the tweet from twitter' do
      # expect do
        post :create, tweet: { twitter_id: '839247587521679360' }
      # end.to change(Tweet, :count).by(1)
      expect(response).to redirect_to edit_admin_tweet_url
      expect(flash[:success]).to be_present
      tweet = assigns(:tweet)
    end
  end
end

