require 'spec_helper'

feature "Registration", js: true do
  include AuthenticationWorkflow
  include WebHelper

  describe "Registering a Profile" do
    let(:user) { create(:user, password: "password", password_confirmation: "password") }

    before do
      Spree::Config.enterprises_require_tos = false

      albania = Spree::Country.create!({ name: "Albania", iso3: "ALB", iso: "AL", iso_name: "ALBANIA", numcode: "8" }, without_protection: true)
      Spree::State.create!({ name: "Berat", abbr: "BRA", country: albania }, without_protection: true)
      Spree::Country.create!({ name: "Chad", iso3: "TCD", iso: "TD", iso_name: "CHAD", numcode: "148" }, without_protection: true)
    end

    after do
      Spree::State.where(name: 'Berat').delete_all
      Spree::Country.where(name: 'Albania').delete_all
      Spree::Country.where(name: 'Chad').delete_all
    end

    it "Allows a logged in user to register a profile" 


    context "when the user has no more remaining enterprises" do
      before do
        user.update_attributes(enterprise_limit: 0)
      end

      it "displays the limit reached page" 

    end
  end

  describe "Terms of Service agreement" do
    let!(:user2) { create(:user) }

    before do
      quick_login_as user2
    end

    context "if accepting Terms of Service is not required" do
      before { Spree::Config.enterprises_require_tos = false }

      it "allows registration as normal" 

    end

    context "if accepting Terms of Service is required" do
      before { Spree::Config.enterprises_require_tos = true }

      it "does not allow registration unless checkbox is checked" 

    end
  end

  def switch_to_login_tab
    # Link appears to be unresponsive for a while, so keep clicking it until it works
    using_wait_time 0.5 do
      10.times do
        find("a", text: "Login").click()
        break if page.has_selector? "dd.active", text: "Login"
      end
    end
  end

  def click_login_and_ensure_content(content)
    # Buttons appear to be unresponsive for a while, so keep clicking them until content appears
    using_wait_time 1 do
      3.times do
        click_button "Login"
        break if page.has_selector? "div#loading", text: "Hold on a moment, we're logging you in"
      end
    end
    expect(page).to have_content content
  end
end

