require 'spec_helper'

describe 'Shipping Methods', type: :feature do
  stub_authorization!
  let!(:zone) { create(:global_zone) }
  let!(:shipping_method) { create(:shipping_method, zones: [zone]) }

  after do
    Capybara.ignore_hidden_elements = true
  end

  before do
    Capybara.ignore_hidden_elements = false
    # HACK: To work around no email prompting on check out
    allow_any_instance_of(Spree::Order).to receive_messages(require_email: false)
    create(:check_payment_method)

    visit spree.admin_shipping_methods_path
  end

  context 'show' do
    it 'displays existing shipping methods' 

  end

  context 'create' do
    it 'is able to create a new shipping method' 

  end

  # Regression test for #1331
  context 'update' do
    it 'can change the calculator', js: true do
      within('#listing_shipping_methods') do
        click_icon :edit
      end

      expect(find(:css, '.calculator-settings-warning')).not_to be_visible
      select2_search('Flexible Rate', from: 'Calculator')
      expect(find(:css, '.calculator-settings-warning')).to be_visible

      click_button 'Update'
      expect(page).not_to have_content('Shipping method is not found')
    end
  end
end

