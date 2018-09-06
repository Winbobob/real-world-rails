require 'rails_helper'

feature 'Editing Admin account' do
  before :each do
    login_admin
    visit '/admin/edit'
  end

  it 'allows the name to be changed' 


  it 'redirects to the admin edit page after update' 

end

