# frozen_string_literal: true

describe Api::OpenidConnect::UserApplicationsController, type: :controller do
  before do
    @app = FactoryGirl.create(:o_auth_application_with_xss)
    @user = FactoryGirl.create :user
    FactoryGirl.create :auth_with_read, user: @user, o_auth_application: @app
    sign_in @user, scope: :user
  end

  context "when try to XSS" do
    it "should not include XSS script" 

  end
end

