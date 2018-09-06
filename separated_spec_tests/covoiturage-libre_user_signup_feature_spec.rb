require 'rails_helper'

describe 'account creation' do
  skip "DEPRECATED" do

    let(:subdomain) { "http://localhost" }
    before(:each) { sign_up(subdomain) }

    it 'allows user to create account' 


    it 'allows access of subdomain' 


    it 'allows account followup creation' 


    it 'does not allow account creation on subdomain' 


    it 'account owner has admin role for his new created account' 


    def sign_up(subdomain)
  		owner = FactoryBot.attributes_for(:user)

      visit root_path
      click_link 'new_account'

      fill_in 'account[owner_attributes][first_name]', with: owner[:first_name]
      fill_in 'account[owner_attributes][last_name]', with: owner[:last_name]
      fill_in 'account[owner_attributes][email]', with: owner[:email]
      fill_in 'account[owner_attributes][password]', with: owner[:password]
      fill_in 'account[owner_attributes][password_confirmation]', with: owner[:password]
      fill_in 'account[subdomain]', with: subdomain
      click_button 'create_account'
    end

    def sign_up_when_logged_in(subdomain)
      #owner = FactoryBot.attributes_for(:user)

      visit root_path(subdomain: false)
      click_link 'new_account'

      fill_in 'account[subdomain]', with: subdomain
      click_button 'create_account'
    end

  end
end

