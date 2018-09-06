require 'spec_helper'

describe 'User registrations' do
  include IntegrationHelper

  let(:user) { FactoryGirl.create(:user) }

  it 'can change user settings' 


  it 'can change user password' 


  it 'should fail with wrong password' 


  it 'should fail with faulty new password' 


  it 'should fail without using a password to delete an account' 


  it 'should succeed when using a password to delete an account' 


  it 'should leave guides that belong to the user when deleting an account' 

end

