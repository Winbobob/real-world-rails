require 'rails_helper'

describe 'Sign in and sign out', js: true do

  def fill_in_form
    fill_in "Email address", with: user.email
    fill_in "Password",      with: user.identity.password
  end

  let!(:circle) { submit_form(:circle_create_form).result }
  
  context 'Sign in with correct data' do

    let!(:user) { create(:circle_role_volunteer, circle: circle, status: :active).user }

    it 'works (as well as logout)' 

  end


  context 'Sign in with incorrect data' do

    let!(:user) do 
      user = create(:circle_role_volunteer, circle: circle, status: :active).user
      user.identity.password = "wrong password"
      user
    end

    it 'shows an error message' 

  end

  context 'Pending user signs in' do

    let!(:circle) { submit_form(:circle_create_form, must_activate_users: true).result }
    let!(:user) { create(:circle_role_volunteer, circle: circle, status: :pending).user }

    it 'sees membership pending message' 

  end


end

