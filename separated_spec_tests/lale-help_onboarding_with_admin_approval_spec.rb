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


  context 'circle membership requires admin approval' do

    let!(:circle) { submit_form(:circle_create_form, must_activate_users: true).result }

    it 'works' 

  end


  context "admin approves new user" do
    
    let!(:circle) { submit_form(:circle_create_form, must_activate_users: true).result }
    let!(:new_member) { create(:circle_role_volunteer, circle: circle, status: :pending).user }

    before do
      circle.update_attribute :must_activate_users, true
    end

    it "works" 

  end

  context "User joins second circle" do

    let!(:circle_1) { submit_form(:circle_create_form, must_activate_users: true).result }
    let!(:circle_2) { submit_form(:circle_create_form, must_activate_users: true).result }
    let!(:circle_1_role) { create(:circle_role_volunteer, circle: circle_1, status: :active) }
    let!(:user) { circle_1_role.user }
    let!(:circle_2_role) { create(:circle_role_volunteer, circle: circle_2, user: user, status: :pending) }

    it "is still active on first circle, pending on the second" 

  end

end

