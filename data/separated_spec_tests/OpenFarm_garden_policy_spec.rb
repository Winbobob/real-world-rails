require 'spec_helper'

describe GardenPolicy do
  subject { GardenPolicy }

  let (:current_user) { FactoryGirl.create :user }
  let (:public_garden) { FactoryGirl.create :garden }
  let (:private_garden) { FactoryGirl.create :garden, is_private: true }
  let (:admin) { FactoryGirl.create :user, admin: true }

  permissions :show? do
    it 'denies access if garden is private' 


    it 'grants access if garden is private and current_user is admin' 


    it 'grants access if garden is public and user is nil' 


    it 'grants access if garden is private and belongs to current user' 

  end

  context 'for a user' do
    it 'should only return gardens in scope that are public' 


    it 'should only return public gardens unless they are current_user' 


    it 'should return all gardens in scope when user is admin' 

  end
end

