require 'rails_helper'

describe PushNotificationController do
  let(:user) { Fabricate(:user) }

  context "logged out" do
    it "should not allow subscribe" 

  end

  context "logged in" do
    before { sign_in(user) }

    it "should subscribe" 


    it "should fix duplicate subscriptions" 


    it "should not create duplicate subscriptions" 


    it "should unsubscribe with existing subscription" 


    it "should unsubscribe without subscription" 

  end

end

