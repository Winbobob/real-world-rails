require 'spec_helper'

describe I18nHelper, type: :helper do
  let(:user) { create(:user) }

  # In the real world, the helper is called in every request and sets
  # I18n.locale to the chosen locale or the default. For testing purposes we
  # have to restore I18n.locale for unit tests that don't call the helper, but
  # rely on translated strings.
  around do |example|
    locale = I18n.locale
    example.run
    I18n.locale = locale
  end

  context "as guest" do
    before do
      allow(helper).to receive(:spree_current_user) { nil }
    end

    it "sets the default locale" 


    it "sets the chosen locale" 


    it "remembers the chosen locale" 


    it "ignores unavailable locales" 


    it "remembers the last chosen locale" 


    it "remembers the chosen locale after logging in" 


    it "forgets the chosen locale without cookies" 

  end

  context "logged in" do
    before do
      allow(helper).to receive(:spree_current_user) { user }
    end

    it "sets the default locale" 


    it "sets the chosen locale" 


    it "remembers the chosen locale" 


    it "remembers the last chosen locale" 


    it "remembers the chosen locale after logging out" 


    it "remembers the chosen locale on another computer" 

  end
end

