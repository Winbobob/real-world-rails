require 'spec_helper'

describe ApiV1::InvitationsController do

  describe "#resend" do
    it "resends an invite" 

  end

  describe "#create" do
    before do
      @users = []
      @emails = "foo@localhost.com billg@microsoft.com fred@teambox.com"
      5.times { @users << Factory(:user, :auto_accept_invites => false) }
      @project = Factory.create(:project)
    end

    it "accepts email addresses as email addresses" 


    it "accepts usernames as existing users" 


    it "accepts both emails and usernames" 

  end

end


