require File.dirname(__FILE__) + '/../spec_helper'

describe Users::RegistrationsController, "create" do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    stub_request(:get, /#{INatAPIService::ENDPOINT}/).
      to_return(status: 200, body: "{ }",
        headers: { "Content-Type" => "application/json" })
  end

  it "should create a user" 


  it "should return json about the user" 


  it "should not return the password" 


  it "should show errors when invalid" 


  it "should not have duplicate email errors when email taken" 


  it "should assign a user to a site" 


  it "should accept time_zone" 

  it "should accept preferred_photo_license" 

end

