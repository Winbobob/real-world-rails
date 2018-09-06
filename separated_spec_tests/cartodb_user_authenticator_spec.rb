require 'spec_helper_min'
require 'carto/user_authenticator'

describe Carto::UserAuthenticator do
  include Carto::UserAuthenticator

  before(:all) do
    @user_password = 'admin123'
    @user = FactoryGirl.create(:carto_user, password: @user_password)
  end

  after(:all) do
    @user.delete
  end

  it "should authenticate if given email and password are correct" 


  it "should authenticate with case-insensitive email and username" 


end

