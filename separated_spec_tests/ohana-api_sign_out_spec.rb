require 'rails_helper'

feature 'Signing out' do
  background do
    login_admin
    visit edit_admin_registration_path
  end

  it 'redirects to the admin sign in page' 

end

