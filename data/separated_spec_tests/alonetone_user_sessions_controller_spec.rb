require "rails_helper"

RSpec.describe UserSessionsController, type: :controller do
  fixtures :users

  it "should successfully login with alonetone login" 


  it "should successfully login with email" 


  it "should always remember user" 


  it "should redirect to user's home after login" 


  it "should redirect to last page viewed after login" 


  it "should not login a user with a bad password" 


  it "should log out when requested" 


  it 'should delete session cookie on logout' 


  # this is in authlogic, needs testing since we modify it (see users_controller_spec)
  it "should update IP and last_request_at" 


end

