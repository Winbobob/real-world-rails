require 'rails_helper'
require_dependency 'user_authenticator'

def github_auth(email_valid)
  {
    email: "user53@discourse.org",
    username: "joedoe546",
    email_valid: email_valid,
    omit_username: nil,
    name: "Joe Doe 546",
    authenticator_name: "github",
    extra_data: {
      github_user_id: "100",
      github_screen_name: "joedoe546"
    },
    skip_email_validation: false
  }
end

describe UserAuthenticator do
  context "#finish" do
    let(:authenticator) { Auth::GithubAuthenticator.new }
    let(:group) { Fabricate(:group, automatic_membership_email_domains: "discourse.org") }

    before do
      SiteSetting.enable_github_logins = true
    end

    it "confirms email and adds the user to appropraite groups based on email" 


    it "doesn't confirm email if email is invalid" 


    it "doesn't confirm email if it was changed" 

  end
end

