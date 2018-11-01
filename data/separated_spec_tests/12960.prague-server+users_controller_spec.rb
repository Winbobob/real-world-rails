require 'spec_helper'

describe Admin::UsersController do
  let(:admin) { create(:confirmed_user, admin: true) }

  before :each do
    sign_in admin
  end

  describe '#index' do
    let!(:regular_users) { create_list(:user, 2, admin: false) }

    it 'should list all users including admins if no param present' 


    it 'should only list admins if param present' 

  end

  describe '#edit' do
    let(:user) { create(:user) }

    it 'should assign user and render edit template' 

  end

  describe '#update' do
    let(:user) { create(:user) }

    it 'should update user and redirect' 

  end
end

