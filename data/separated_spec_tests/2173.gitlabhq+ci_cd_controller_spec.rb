require 'spec_helper'

describe Groups::Settings::CiCdController do
  let(:group) { create(:group) }
  let(:user) { create(:user) }

  before do
    group.add_maintainer(user)
    sign_in(user)
  end

  describe 'GET #show' do
    it 'renders show with 200 status code' 

  end

  describe 'PUT #reset_registration_token' do
    subject { put :reset_registration_token, group_id: group }

    it 'resets runner registration token' 


    it 'redirects the user to admin runners page' 

  end
end

