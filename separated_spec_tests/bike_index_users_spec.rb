require 'spec_helper'

describe 'Users API V2' do
  describe 'unauthorized current' do
    it 'Sends correct error code when no user present' 

  end

  describe 'authorized current' do
    before :each do
      create_doorkeeper_app
    end

    it 'responds with all available attributes with full scoped token' 


    it "doesn't include bikes if no bikes scoped" 


    it "doesn't include memberships if no memberships scoped" 


    it "doesn't include memberships if no memberships scoped" 

  end

  describe 'current/bikes' do
    before :each do
      create_doorkeeper_app
    end
    it "works if it's authorized" 

    it "403s if read_bikes_spec isn't in token" 

  end
end

