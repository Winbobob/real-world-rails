require "rails_helper"

describe UserAnonymizer do

  let(:admin) { Fabricate(:admin) }

  describe "event" do
    let(:user) { Fabricate(:user, username: "edward") }
    subject(:make_anonymous) { described_class.make_anonymous(user, admin, anonymize_ip: '2.2.2.2') }

    it "triggers the event" 

  end

  describe "make_anonymous" do
    let(:user) { Fabricate(:user, username: "edward") }
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


    it "logs the action with the original details" 


    it "logs the action without the original details" 


    it "removes external auth assocations" 


    it "removes api key" 


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

