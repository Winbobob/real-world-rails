require 'spec_helper'

describe UsersController do

  let(:user) { FactoryGirl.create(:confirmed_user) }
  let(:public_user) { FactoryGirl.create(:confirmed_user) }
  let(:private_user) { FactoryGirl.create(:confirmed_user, is_private: true) }

  it 'should show the user their profile' 


  it 'should show the user a public profile' 


  it 'should not show the user a private profile' 


  it 'should show the user the edit page' 


  it 'should only show public users on index' 


  it 'should show all users on index if the current user is admin' 


  it 'should not update with incomplete information' 


  it 'should update with complete information' 


  it 'should redirect users from gardens to their profile' 

end

