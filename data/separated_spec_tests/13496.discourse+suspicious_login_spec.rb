require 'rails_helper'

describe Jobs::SuspiciousLogin do

  let(:user) { Fabricate(:moderator) }

  before do
    UserAuthToken.stubs(:login_location).with("1.1.1.1").returns("Location 1")
    UserAuthToken.stubs(:login_location).with("1.1.1.2").returns("Location 1")
    UserAuthToken.stubs(:login_location).with("1.1.2.1").returns("Location 2")
  end

  it "will not send an email on first login" 


  it "will not send an email when user log in from a known location" 


  it "will send an email when user logs in from a new location" 


end

