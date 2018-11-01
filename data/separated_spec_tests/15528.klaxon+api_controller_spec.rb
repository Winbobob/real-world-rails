require 'rails_helper'

RSpec.describe ApiController, type: :request do

  before(:each) do
    WebMock.allow_net_connect!

    # login
    @user = User.where(email: 'test@test.com').first_or_create
    get(token_session_path, params: { token: LoginToken.create(user: @user) })
  end

  describe "/page-preview" do
    it "can query the tmp homepage" 

  end

  it "can get the users" 


  it "creates a page by url and can update that page's selector" 


  it "has stats"
  it "has subscriptions"
  it "has pages"

end

