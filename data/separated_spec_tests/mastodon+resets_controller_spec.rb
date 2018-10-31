require 'rails_helper'

describe Admin::ResetsController do
  render_views

  let(:account) { Fabricate(:account, user: Fabricate(:user)) }
  before do
    sign_in Fabricate(:user, admin: true), scope: :user
  end

  describe 'POST #create' do
    it 'redirects to admin accounts page' 

  end
end

