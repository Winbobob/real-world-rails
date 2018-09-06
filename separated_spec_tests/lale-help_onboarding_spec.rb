require 'rails_helper'

describe 'New User On-boarding', js: true do

  def fill_in_form
    fill_in "First Name",            with: "Phil"
    fill_in "Last Name",             with: "Monroe"
    fill_in "Email",                 with: "test@example.com"
    fill_in "Password",              with: "passworD1"
    fill_in "Password Confirmation", with: "passworD1"
    fill_in "Mobile Phone",          with: "1-800-867-5309"
    fill_in "City",                  with: "San Francisco"
    fill_in "State",                 with: "CA"
    fill_in "Postal Code",           with: "94109"
    check   "Accept Terms and Conditions"
  end

  context 'regular sign up flow' do
    context 'with circle nearby' do
      let!(:circle) { submit_form(:circle_create_form).result }

      it 'works' 

    end

    context 'create new circle' do
      it 'works' 

    end
  end


  context 'join circle flow' do
    let!(:circle) { submit_form(:circle_create_form).result }

    it 'works' 

  end

end

