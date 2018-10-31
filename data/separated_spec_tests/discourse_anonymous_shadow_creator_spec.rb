require 'rails_helper'

describe AnonymousShadowCreator do

  it "returns no shadow by default" 


  context "Anonymous posting is enabled" do

    before { SiteSetting.allow_anonymous_posting = true }

    let(:user) { Fabricate(:user_single_email, trust_level: 3) }

    it "returns no shadow if trust level is not met" 


    it "returns no shadow if must_approve_users is true and user is not approved" 


    it "returns a new shadow once time expires" 


    it "returns a shadow for a legit user" 


    it "works even when names are required" 


    it "works when there is an email whitelist" 

  end

end

