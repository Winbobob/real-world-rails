require 'spec_helper'

describe UserPolicy do
  subject { UserPolicy }

  let (:current_user) { FactoryGirl.create :user }
  let (:other_user) { FactoryGirl.create :user }
  let (:private_user) { FactoryGirl.create :user, is_private: true}
  let (:admin) { FactoryGirl.create :user, admin: true }

  permissions :show? do
    it 'denies access if viewed user is private' 


    it 'grants access if viewed user is private and current_user is admin' 


    it 'grants access if viewed user is the current user' 

  end

  permissions :update? do
    it 'denies updating if viewed user is not current user' 

    it 'grants update if user is current user' 

    it 'grants update if user is admin user' 

  end

  permissions :edit? do
    it 'denies edit if viewed user is not current user' 

    it 'grants edit if user is current user' 

    it 'grants edit if user is admin user' 

  end

  context "for a user" do
    it "should only return users on index that are public" 


    it "should return all users on index when current_user is admin" 

  end
end

