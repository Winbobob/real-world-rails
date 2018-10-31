require 'rails_helper'

describe Admin::StatusesController do
  render_views

  let(:user) { Fabricate(:user, admin: true) }
  let(:account) { Fabricate(:account) }
  let!(:status) { Fabricate(:status, account: account) }
  let(:media_attached_status) { Fabricate(:status, account: account, sensitive: !sensitive) }
  let!(:media_attachment) { Fabricate(:media_attachment, account: account, status: media_attached_status) }
  let(:sensitive) { true }

  before do
    sign_in user, scope: :user
  end

  describe 'GET #index' do
    it 'returns http success with no media' 


    it 'returns http success with media' 

  end

  describe 'POST #create' do
    subject do
      -> { post :create, params: { :account_id => account.id, action => '', :form_status_batch => { status_ids: status_ids } } }
    end

    let(:action) { 'nsfw_on' }
    let(:status_ids) { [media_attached_status.id] }

    context 'when action is nsfw_on' do
      it 'updates sensitive column' 

    end

    context 'when action is nsfw_off' do
      let(:action) { 'nsfw_off' }
      let(:sensitive) { false }

      it 'updates sensitive column' 

    end

    context 'when action is delete' do
      let(:action) { 'delete' }

      it 'removes a status' 

    end

    it 'redirects to account statuses page' 

  end
end

