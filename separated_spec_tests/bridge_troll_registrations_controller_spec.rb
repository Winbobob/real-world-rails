require 'rails_helper'

describe DeviseOverrides::RegistrationsController do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @region = Region.create!(name: 'Neue Region')
  end

  describe "#create" do
    describe 'region selection' do
      it "allows user to select a region" 


      it "does not asplode if user does not select a region" 

    end
  end
end

