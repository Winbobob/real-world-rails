require 'rails_helper'

describe Admin::PluginsController do

  it "is a subclass of AdminController" 


  context "while logged in as an admin" do
    before do
      sign_in(Fabricate(:admin))
    end

    it 'should return JSON' 

  end
end

