require 'spec_helper'

describe Admin::GroupsController do
  let(:group) { create(:group) }
  let(:project) { create(:project, namespace: group) }
  let(:admin) { create(:admin) }

  before do
    sign_in(admin)
  end

  describe 'DELETE #destroy' do
    it 'schedules a group destroy' 


    it 'redirects to the admin group path' 

  end

  describe 'PUT #members_update' do
    let(:group_user) { create(:user) }

    it 'adds user to members' 


    it 'can add unlimited members' 


    it 'adds no user to members' 

  end
end

