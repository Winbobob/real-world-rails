# frozen_string_literal: true

require "spec_helper"

describe AppServices::Create do
  let(:current_admin) { create(:admin) }
  let(:name) { "An app" }
  let(:create_app) do
    AppServices::Create.call(
      current_admin: current_admin,
      name: name,
      open_tracking_enabled: false,
      click_tracking_enabled: false,
      custom_tracking_domain: nil,
      from_domain: nil,
      dkim_enabled: false
    )
  end

  it "should create an app" 


  it "should return the created app" 


  it "should create the app in the same team as the admin" 


  it "should be successfull" 


  context "name is blank" do
    let(:name) { "" }
    it "should not be succesfull" 


    it "should return the unsaved app" 

  end

  context "user does not have permission" do
    let(:app_policy) { double }
    before :each do
      expect(AppPolicy).to receive(:new) { app_policy }
      expect(app_policy).to receive(:create?) { false }
    end

    it "should not be successfull" 

  end
end

