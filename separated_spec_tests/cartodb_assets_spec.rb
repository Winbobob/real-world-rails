# coding: UTF-8

require 'spec_helper'

describe "Assets API" do

  before(:each) do
    @user = FactoryGirl.create(:valid_user)

    delete_user_data @user
    host! "#{@user.username}.localhost.lan"
  end

  after(:each) do
    @user.destroy
  end

  let(:params) { { :api_key => @user.api_key } }

  it 'creates a new asset' 


  it 'creates a new asset with spaces in name' 


  it "returns some error message when the asset creation fails" 


  it "finds image file extension" 


  it "detects incorrect image file extension" 


  it "deletes an asset" 


end

