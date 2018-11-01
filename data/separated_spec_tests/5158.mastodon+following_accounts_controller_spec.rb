require 'rails_helper'

describe FollowingAccountsController do
  render_views

  let(:alice) { Fabricate(:account, username: 'alice') }
  let(:followee0) { Fabricate(:account) }
  let(:followee1) { Fabricate(:account) }

  describe 'GET #index' do
    let!(:follow0) { alice.follow!(followee0) }
    let!(:follow1) { alice.follow!(followee1) }

    context 'when format is html' do
      subject(:response) { get :index, params: { account_username: alice.username, format: :html } }

      it 'assigns follows' 

    end

    context 'when format is json' do
      subject(:response) { get :index, params: { account_username: alice.username, page: page, format: :json } }
      subject(:body) { JSON.parse(response.body) }

      context 'with page' do
        let(:page) { 1 }

        it 'returns followers' 

      end

      context 'without page' do
        let(:page) { nil }

        it 'returns followers' 

      end
    end
  end
end

