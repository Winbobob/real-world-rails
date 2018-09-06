# frozen_string_literal: true

require "rails_helper"
require "oauth2"

describe "OAuth2" do
  let(:password) { "123123" }
  let(:user) { FactoryBot.create(:user, password: password, password_confirmation: password) }
  let(:app) { FactoryBot.create(:application) }

  let(:client) do
    OAuth2::Client.new(app.uid, app.secret) do |b|
      b.request :url_encoded
      b.adapter :rack, Rails.application
    end
  end

  describe "auth_code" do
    let(:grant) { FactoryBot.create(:access_grant, application: app, redirect_uri: "#{app.redirect_uri}/callback") }

    it "should work" 

  end

  describe "password get_token" do
    it "should work" 

  end
end

