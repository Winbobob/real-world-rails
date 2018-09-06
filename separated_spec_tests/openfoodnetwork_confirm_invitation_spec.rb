require "spec_helper"

feature "Confirm invitation as manager" do
  include UIComponentHelper # for be_logged_in_as

  describe "confirm email and set password" do
    let(:email) { "test@example.org" }
    let(:user) { Spree::User.create(email: email, unconfirmed_email: email, password: "secret") }

    before do
      user.reset_password_token = Devise.friendly_token
      user.reset_password_sent_at = Time.now.utc
      user.save!
    end

    it "allows you to set a password" 

  end
end

