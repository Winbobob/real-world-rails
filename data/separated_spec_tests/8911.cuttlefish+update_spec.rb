# frozen_string_literal: true

describe AppServices::Update do
  let(:app) { create(:app, team: team) }
  let(:current_admin) { create(:admin, team: team) }
  let(:team) { create(:team) }
  let(:update_app) do
    AppServices::Update.call(
      current_admin: current_admin,
      id: app.id,
      attributes: attributes
    )
  end
  let(:attributes) do
    {
      name: name,
      open_tracking_enabled: app.open_tracking_enabled,
      click_tracking_enabled: app.click_tracking_enabled,
      custom_tracking_domain: app.custom_tracking_domain,
      from_domain: app.from_domain
    }
  end
  let(:name) { "An updated name" }

  it "should update the app name" 


  it "should be successfull" 


  it "should return the updated app" 


  context "an invalid name" do
    let(:name) { "" }

    it "should not be successfull" 


    it "should return the app" 

  end

  context "the user doesn't have permission" do
    let(:app_policy) { double }
    before :each do
      expect(AppPolicy).to receive(:new) { app_policy }
      expect(app_policy).to receive(:update?) { false }
    end

    it "should not be successfull" 

  end

  context "app doesn't exist" do
    before(:each) { app.destroy! }

    it "should not be successfull" 

  end

  context "just updating from domain" do
    let(:attributes) { { from_domain: "foo.com" } }

    it "should be successfull" 


    it "should return the updated app" 

  end
end

