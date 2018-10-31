require 'rails_helper'

describe AdminPagesController do
  let(:admin) { create(:user, admin: true) }

  describe "POST #send_test_email" do
    before do
      sign_in admin
    end

    def make_request
      post :send_test_email
    end

    it 'sends two test emails' 

  end

  describe "GET #raise_exception" do
    before do
      sign_in admin
    end

    it 'raises an exception' 

  end
end

