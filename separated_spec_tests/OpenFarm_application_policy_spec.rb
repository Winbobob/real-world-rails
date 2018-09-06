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
  it 'reindexes guides' 

end

