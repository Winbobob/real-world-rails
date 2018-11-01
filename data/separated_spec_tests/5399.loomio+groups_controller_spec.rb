require 'rails_helper'

describe GroupsController do
  let(:group) { create :formal_group }
  let(:guest_group) { create :guest_group }
  let(:user) { create :user }
  before { group.add_member! user }

  describe 'show' do
    it 'displays an xml feed' 


    it 'displays an xml error when group is not found' 

  end

  describe 'export' do
    it 'loads an export' 


    it 'does not allow non-admins to see export' 

  end
end

