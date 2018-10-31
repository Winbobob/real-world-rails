require "rails_helper"

RSpec.describe MembershipMailer, type: :mailer do
  describe "welcome" do
    let(:user) { User.new(email: "to@example.org") }
    let(:token) { "abc123" }
    let(:mail) { MembershipMailer.welcome(user, plan, token) }

    context "for members" do
      let(:plan) { "individual" }

      it "emails thanks for joining" 

    end

    context "for friends" do
      let(:plan) { "friend" }

      it "emails thanks for supporting" 

    end
  end
end

