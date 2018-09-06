require 'rails_helper'

RSpec.describe Admin::ConfirmationsController, type: :controller do
  render_views

  before do
    sign_in Fabricate(:user, admin: true), scope: :user
  end

  describe 'POST #create' do
    it 'confirms the user' 


    it 'raises an error when there is no account' 


    it 'raises an error when there is no user' 

  end

  describe 'POST #resernd' do
    subject { post :resend, params: { account_id: account.id } }

    let(:account) { Fabricate(:account) }
    let!(:user) { Fabricate(:user, confirmed_at: confirmed_at, account: account) }

    before do
      allow(UserMailer).to receive(:confirmation_instructions) { double(:email, deliver_later: nil) }
    end

    context 'when email is not confirmed' do
      let(:confirmed_at) { nil }

      it 'resends confirmation mail' 

    end

    context 'when email is confirmed' do
      let(:confirmed_at) { Time.zone.now }

      it 'does not resend confirmation mail' 

    end
  end
end

