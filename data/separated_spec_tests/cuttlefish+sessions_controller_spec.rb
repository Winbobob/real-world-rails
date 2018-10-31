# frozen_string_literal: true

require "spec_helper"

describe Admins::SessionsController, type: :controller do
  before :each do
    request.env["devise.mapping"] = Devise.mappings[:admin]
  end

  context "request is over http" do
    context "There is one admin already registered" do
      before :each do
        team = Team.create!
        team.admins.create!(email: "foo@bar.com", password: "guess this")
      end

      it "should redirect to https" 

    end
  end

  context "request is over https" do
    before :each do
      request.env["HTTPS"] = "on"
    end

    context "This is a fresh install and there are no admins registered" do
      it "should redirect to the registration page" 

    end

    context "There is one admin already registered" do
      before :each do
        team = Team.create!
        team.admins.create!(email: "foo@bar.com", password: "guess this")
      end

      it "should not redirect https" 

    end
  end
end

