require 'rails_helper'

describe UserCredentialsController do
  def valid_attributes(options = {})
    {
      :credential_name => "some_name",
      :credential_value => "some_value"
    }.merge(options)
  end

  before do
    sign_in users(:bob)
    @file = fixture_file_upload('user_credentials.json')
  end

  describe "GET index" do
    it "only returns UserCredentials for the current user" 

  end

  describe "GET edit" do
    it "only shows UserCredentials for the current user" 

  end

  describe "Post import" do
    it "asserts user credentials were created for current user only" 


    it "asserts that primary id in json file is ignored" 


    it "duplicate credential name shows an error that it is not saved" 

  end

  describe "POST create" do
    it "creates UserCredentials for the current user" 


    it "shows errors" 


    it "will not create UserCredentials for other users" 

  end

  describe "PUT update" do
    it "updates attributes on UserCredentials for the current user" 


    it "shows errors" 

  end

  describe "DELETE destroy" do
    it "destroys only UserCredentials owned by the current user" 

  end
end

