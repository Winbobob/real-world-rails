require 'rails_helper'

RSpec.describe Api::V1::NotificationsController, type: :controller do
  render_views

  let(:user)  { Fabricate(:user, account: Fabricate(:account, username: 'alice')) }
  let(:token) { Fabricate(:accessible_access_token, resource_owner_id: user.id, scopes: scopes) }
  let(:other) { Fabricate(:user, account: Fabricate(:account, username: 'bob')) }

  before do
    allow(controller).to receive(:doorkeeper_token) { token }
  end

  describe 'GET #show' do
    let(:scopes) { 'read:notifications' }

    it 'returns http success' 

  end

  describe 'POST #dismiss' do
    let(:scopes) { 'write:notifications' }

    it 'destroys the notification' 

  end

  describe 'POST #clear' do
    let(:scopes) { 'write:notifications' }

    it 'clears notifications for the account' 

  end

  describe 'GET #index' do
    let(:scopes) { 'read:notifications' }

    before do
      first_status = PostStatusService.new.call(user.account, 'Test')
      @reblog_of_first_status = ReblogService.new.call(other.account, first_status)
      mentioning_status = PostStatusService.new.call(other.account, 'Hello @alice')
      @mention_from_status = mentioning_status.mentions.first
      @favourite = FavouriteService.new.call(other.account, first_status)
      @follow = FollowService.new.call(other.account, 'alice')
    end

    describe 'with no options' do
      before do
        get :index
      end

      it 'returns http success' 


      it 'includes reblog' 


      it 'includes mention' 


      it 'includes favourite' 


      it 'includes follow' 

    end

    describe 'with excluded mentions' do
      before do
        get :index, params: { exclude_types: ['mention'] }
      end

      it 'returns http success' 


      it 'includes reblog' 


      it 'excludes mention' 


      it 'includes favourite' 


      it 'includes follow' 

    end
  end
end

