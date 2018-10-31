require File.dirname(__FILE__) + '/../spec_helper'

describe OauthTokensController, "create" do
  let(:app) { OauthApplication.make! }
  let(:user) { User.make! }
  it "should return a token for a normal user" 

  it "should return a 401 for an incorrect password" 

  it "should return a 403 for a suspended user" 

end

