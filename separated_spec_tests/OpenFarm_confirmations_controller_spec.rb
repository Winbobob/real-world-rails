require 'spec_helper'

class User
  attr_reader :raw_confirmation_token
end

RSpec.describe ConfirmationsController, type: :controller do
  def visit_user_confirmation_with_token(confirmation_token)
    visit user_confirmation_path(confirmation_token: confirmation_token)
  end

  context 'when confirmation token is valid' do
    context 'when user filled the required settings' do
      let(:user) { FactoryGirl.create(:user, :with_user_setting) }
      it 'redirects to member profile page' 

    end
    context 'when user has not filled the required settings' do
      let(:user) { FactoryGirl.create(:user) }
      it 'redirects to user details page' 

    end
  end

  context 'when confirmation token is invalid' do
    it 'renders error page' 

  end
end

