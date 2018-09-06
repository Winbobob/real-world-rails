require 'spec_helper'

describe InvitesController do
  let(:token) { '123456' }
  let(:user) { create(:user) }
  let(:member) { create(:project_member, invite_token: token, invite_email: 'test@abc.com', user: user) }

  before do
    controller.instance_variable_set(:@member, member)
    sign_in(user)
  end

  describe 'GET #accept' do
    it 'accepts user' 

  end

  describe 'GET #decline' do
    it 'declines user' 

  end
end

