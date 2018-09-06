require 'rails_helper'

RSpec.describe 'creating a new tenant', multitenant: true do
  include ActiveJob::TestHelper

  let(:user) { FactoryGirl.create(:superadmin) }

  before do
    login_as(user, scope: :user)
    Capybara.default_host = "http://#{Account.admin_host}"
  end

  it 'sets up the new tenant' 

end

