require 'rails_helper'

describe Admin::TwoFactorAuthenticationsController do
  render_views

  let(:user) { Fabricate(:user, otp_required_for_login: true) }
  before do
    sign_in Fabricate(:user, admin: true), scope: :user
  end

  describe 'DELETE #destroy' do
    it 'redirects to admin accounts page' 

  end
end

