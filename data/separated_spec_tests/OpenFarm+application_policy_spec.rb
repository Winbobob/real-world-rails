require 'spec_helper'

describe ApplicationPolicy do
  subject { ApplicationPolicy }

  let (:current_user) { FactoryGirl.create :user }
  let (:other_user) { FactoryGirl.create :user }
  let (:private_user) { FactoryGirl.create :user, is_private: true}
  let (:admin) { FactoryGirl.create :user, admin: true }

  permissions :index? do
    it 'should default to deny viewing the index for a record' 

  end

  permissions :show? do
    it 'should default to deny showing a record' 

  end

  permissions :update? do
    it 'should default to denying an update' 

  end

  # This is just a hack - the scope on the application policy 
  # is just a wrapper method that returns the scope being
  # called for.
  context "for a user" do
    it "should only return records action" 
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

