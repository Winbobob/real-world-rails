require_relative '../spec_helper_min'

describe PasswordResetsController do

  before(:all) do
    User.any_instance.stubs(:update_in_central).returns(true)
    @user = FactoryGirl.create(:user)
  end

  after(:each) do
    @user.password_reset_token = nil
    @user.password_reset_sent_at = nil
    @user.save
  end

  after(:all) do
    @user.destroy
  end

  describe('#create') do
    it 'shows an error if the email is blank' 


    it 'shows an error if the email does not exist' 


    it 'updates the user password_reset_token and password_reset_sent_at' 


    it 'redirects to the right page' 

  end

  describe('#update') do
    before(:each) do
      @user.password_reset_token = 'token'
      @user.password_reset_sent_at = Time.zone.now
      @user.save
    end

    it 'shows an error if the passwords do not match' 


    it 'redirects to the initial password reset view if the token has expired' 


    it 'updates the user password' 


    it 'resets the password_reset_token' 


    it 'redirects to the right page' 

  end
end

