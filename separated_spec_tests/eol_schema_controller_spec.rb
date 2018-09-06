require "spec_helper"

describe SchemaController do

  before(:all) do
    load_foundation_cache
    @user = User.gen
    @user.grant_permission(:see_data)
  end

  after(:each) do
    session[:user_id] = nil
  end

  describe 'GET terms' do

    it 'should redirect known terms to the glossary' 


  end

end

