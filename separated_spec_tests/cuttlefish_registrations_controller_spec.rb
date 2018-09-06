require 'spec_helper'

describe Admins::RegistrationsController, type: :controller do
  before :each do
    request.env["devise.mapping"] = Devise.mappings[:admin]
    request.env['HTTPS'] = 'on'
  end

  context "This a new install of Cuttlefish with no users" do
    it "should allow an admin to register" 


    it "should allow an admin to register" 

  end

  context "There is already one admin registered" do
    let(:team) { Team.create! }
    let(:admin) { team.admins.create!(email: "foo@bar.com", password: "guess this") }
    before :each do
      admin
    end

    it "should not allow an admin to register" 


    it "should not allow an admin to register" 


    it "should allow an admin to update their account details" 


    it "should allow an admin to update their account details" 

  end
end

