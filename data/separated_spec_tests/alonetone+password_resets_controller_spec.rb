require "rails_helper"

RSpec.describe PasswordResetsController, type: :controller do
  fixtures :users

  context 'resetting' do
    it "should error if the email provided doesn't exist" 


    it "should disallow logins after resetting" 


    it 'should send an email with link to reset pass' 


    it 'should render form to reset password given a decent token' 


    it 'should not render form to reset password given some bullshit token' 


    it 'should allow user to manually type in password and login user' 


    it 'should allow user to manually type in password and present edit again if passes do not match' 

  end
end

