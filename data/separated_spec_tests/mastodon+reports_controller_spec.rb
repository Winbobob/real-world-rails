# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ReportsController, type: :controller do
  render_views

  let(:user)  { Fabricate(:user, account: Fabricate(:account, username: 'alice')) }
  let(:token) { Fabricate(:accessible_access_token, resource_owner_id: user.id, scopes: scopes) }

  before do
    allow(controller).to receive(:doorkeeper_token) { token }
  end

  describe 'POST #create' do
    let(:scopes)  { 'write:reports' }
    let!(:status) { Fabricate(:status) }
    let!(:admin)  { Fabricate(:user, admin: true) }

    before do
      allow(AdminMailer).to receive(:new_report).and_return(double('email', deliver_later: nil))
      post :create, params: { status_ids: [status.id], account_id: status.account.id, comment: 'reasons' }
    end

    it 'creates a report' 


    it 'sends e-mails to admins' 

  end
end

