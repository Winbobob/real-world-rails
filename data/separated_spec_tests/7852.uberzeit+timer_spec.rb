require 'spec_helper'

describe API::User::Resources::Timer do
  include Warden::Test::Helpers

  let(:api_user) { FactoryGirl.create(:user) }
  let(:json) { JSON.parse(response.body) }

  before do
    login_as api_user
  end

  describe 'PUT /api/timer' do

    let!(:timer) { FactoryGirl.create(:time_entry, user: api_user, ends: nil) }

    it 'does not add a day if the end equals the start time' 


  end
end

