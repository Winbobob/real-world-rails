require 'spec_helper'
require 'support/pages/custom_fields'

describe 'custom fields', js: true do
  let(:user) { FactoryGirl.create :admin }
  let(:cf_page) { Pages::CustomFields.new }

  before do
    login_as(user)
  end

  describe "creating a new date custom field" do
    before do
      cf_page.visit!

      click_on "Create a new custom field"
    end

    it "creates a new date custom field" 

  end
end
