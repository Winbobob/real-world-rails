require 'spec_helper'

describe Api::SessionsController, :type => :controller do

  before :each do
    @admin_role = create :role
    @user = create :user, :password => 'test_password', :password_confirmation => 'test_password', :role_ids => [@admin_role.name]
    controller.stub :mobile_db_key => 'TEST_DB_KEY'
  end

  it 'should login' 


  it 'should logout' 


  it 'should set session lifetime to 1 week' 


  it 'should specify the enquiry feature in the response header when enquiries is turned on.' 


  describe '#register' do
    it 'should set verified status to false' 


    it 'should not attempt to create a user if already exists' 

  end

end

