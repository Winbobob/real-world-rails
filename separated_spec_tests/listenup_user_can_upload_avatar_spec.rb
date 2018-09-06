require 'rails_helper'

feature 'users can add an avatar', %Q(
  As a user
  Upload an avatar
  So that everyone can see how cool I am

) do

  # Acceptance Criteria

  # When I visit the edit profile page, I am presented with a
  # file upload field, browse button, and upload button.
  # When I select a proper file and click on upload, I get a
  # success message and see the image on the page.
  # When I select the wrong file type, I get an error message
  # and can browse for another file.

  scenario 'user sees the proper field and browse and upload buttons' do
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    click_on 'edit account'
    expect(page).to have_content 'add an avatar'

    attach_file('user_avatar', 'spec/fixtures/avatar.jpg')

    fill_in 'current password', with: user.password
    within('#update') do
     click_button 'update'
    end

    expect(page).to have_content 'You updated your account successfully.'
    visit "users/#{user.username}"
    expect(page.html).to include("/uploads/user/avatar/#{user.id}/avatar.jpg")
  end
end

