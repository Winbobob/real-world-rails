require 'rails_helper'

describe 'home/_blurb.html.haml', type: "view" do
  context 'signed out' do
    before :each do
      controller.stub(:current_user) { nil }
      render
    end

    it 'has description' 


    it 'has signup section' 


    it 'has a link to sign in' 

  end
end

