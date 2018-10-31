require 'rails_helper'
require_dependency 'wizard'
require_dependency 'wizard/builder'
require_dependency 'wizard/step_updater'

describe Wizard::StepUpdater do
  before do
    SiteSetting.wizard_enabled = true
  end

  let(:user) { Fabricate(:admin) }
  let(:wizard) { Wizard::Builder.new(user).build }

  context "locale" do
    it "does not require refresh when the language stays the same" 


    it "updates the locale and requires refresh when it does change" 

  end

  it "updates the forum title step" 


  it "updates the introduction step" 


  it "won't allow updates to the default value, when required" 


  context "privacy settings" do
    it "updates to open correctly" 


    it "updates to private correctly" 

  end

  context "contact step" do
    it "updates the fields correctly" 


    it "doesn't update when there are errors" 

  end

  context "corporate step" do

    it "updates the fields properly" 

  end

  context "colors step" do
    context "with an existing color scheme" do
      let!(:color_scheme) { Fabricate(:color_scheme, name: 'existing', via_wizard: true) }

      it "updates the scheme" 

    end

    context "without an existing theme" do
      before do
        Theme.delete_all
      end

      context 'dark theme' do
        it "creates the theme" 

      end

      context 'light theme' do
        it "creates the theme" 

      end
    end

    context "without an existing scheme" do
      it "creates the scheme" 

    end
  end

  context "logos step" do
    it "updates the fields correctly" 

  end

  context "icons step" do
    it "updates the fields correctly" 

  end

  context "emoji step" do
    it "updates the fields correctly" 

  end

  context "homepage step" do
    it "updates the fields correctly" 

  end

  context "invites step" do
    let(:invites) {
      return [{ email: 'regular@example.com', role: 'regular' },
              { email: 'moderator@example.com', role: 'moderator' }]
    }

    it "updates the fields correctly" 

  end

end

