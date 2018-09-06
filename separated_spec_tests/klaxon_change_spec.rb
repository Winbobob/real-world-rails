require 'rails_helper'

RSpec.describe Change, type: :request do
  include ActiveJob::TestHelper

  before(:each) do
    WebMock.allow_net_connect!

    # login
    @user = User.where(email: 'test@test.com').first_or_create
    get(token_session_path, token: LoginToken.create(user: @user))
  end

  it "can create multiple snapshots and send an email based on the last pair" 




end

