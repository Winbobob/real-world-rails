# encoding: utf-8

require 'spec_helper_min'
require 'support/helpers'

describe Carto::Api::MetricsController do
  include Warden::Test::Helpers
  include HelperMethods

  before(:all) do
    @user = FactoryGirl.create(:carto_user)
    @intruder = FactoryGirl.create(:carto_user)

    login(@user)
  end

  after(:all) do
    logout(@user)

    @user.destroy
    @instruder.destroy
  end

  it 'should accept all existing events' 


  it 'should reject non existing events' 


  describe 'validations' do
    it 'should require properties' 

  end
end

