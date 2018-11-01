require "rails_helper"

describe UserAnonymizer do

  let(:admin) { Fabricate(:admin) }

  describe "event" do
    let(:user) { Fabricate(:user, username: "edward") }
    subject(:make_anonymous) { described_class.make_anonymous(user, admin, anonymize_ip: '2.2.2.2') }

    it "triggers the event" 

  end

  describe "make_anonymous" do
    let(:original_email) { "edward@example.net" }
    let(:user) { Fabricate(:user, username: "edward", email: original_email) }
    let(:another_user) { Fabricate(:evil_trout) }
    subject(:make_anonymous) { described_class.make_anonymous(user, admin) }

    it "changes username" 


    it "changes email address" 


    it "turns off all notifications" 


    context "Site Settings do not require full name" do
      before do
        SiteSetting.full_name_required = false
      end

      it "resets profile to default values" 

    end

    context "Site Settings require full name" do
      before do
        SiteSetting.full_name_required = true
      end

      it "changes name to anonymized username" 

    end

    it "removes the avatar" 


    it "updates the avatar in posts" 


    it "logs the action with the original details" 


    it "logs the action without the original details" 


    it "removes external auth assocations" 


    it "removes api key" 


    context "executes job" do
      before do
        SiteSetting.queue_jobs = false
      end

      it "removes invites" 


      it "removes email tokens" 


      it "removes email log entries" 


      it "removes incoming emails" 


      it "removes raw email from posts" 


      it "does not delete profile views" 


      it "removes user field values" 

    end
  end

  describe "anonymize_ip" do
    let(:old_ip) { "1.2.3.4" }
    let(:anon_ip) { "0.0.0.0" }
    let(:user) { Fabricate(:user, ip_address: old_ip, registration_ip_address: old_ip) }
    let(:post) { Fabricate(:post) }
    let(:topic) { post.topic }

    it "doesn't anonymize ips by default" 


    it "is called if you pass an option" 


    it "exhaustively replaces all user ips" 


  end

end

