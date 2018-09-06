require 'spec_helper'
require 'support/pages/custom_fields'

describe 'custom fields', js: true do
  let(:user) { FactoryGirl.create :admin }
  let(:cf_page) { Pages::CustomFields.new }

  before do
    login_as(user)
  end

  describe "creating a new list custom field" do
    before do
      cf_page.visit!

      click_on "Create a new custom field"
    end

    it "creates a new list custom field with its options in the right order" 

  end

  context "with an existing list custom field" do
    let!(:custom_field) do
      FactoryGirl.create(
        :list_wp_custom_field,
        name: "Platform",
        possible_values: ["Playstation", "Xbox", "Nintendo", "PC"]
      )
    end

    before do
      allow(EnterpriseToken).to receive(:allows_to?).and_return(true)

      cf_page.visit!

      click_on custom_field.name
    end

    it "adds new options" 


    it "updates the values and orders of the custom options" 


    context "with work packages using the options" do
      before do
        FactoryGirl.create_list(
          :work_package_custom_value,
          3,
          custom_field: custom_field,
          value: custom_field.custom_options[1].id
        )
      end

      it "deletes a custom option and all values using it" 

    end
  end
end

