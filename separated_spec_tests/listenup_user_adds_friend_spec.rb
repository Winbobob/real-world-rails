require 'rails_helper'

feature "user can add friends", %q{
  As a User
  I want to be able to add friends so that I can add songs to their playlist.
} do

  # Acceptance Criteria
  #
  # - I must be signed in
  # - I can only add a friend once
  # - I am given a message that friend was successfully added
  # - I am given a message if friendship already exists

  scenario "user adds friend" do

    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)

    sign_in_as(user1)

    visit users_path
    expect(page).to have_content 'find friends'
    expect(page).to have_content user2.username

    click_on 'add friend'

    expect(page).to have_content "#{user2.username} added as a friend!"

  end

  scenario "user attempts to create friendship that already exists" do

    friendship = FactoryGirl.create(:friendship)

    sign_in_as(friendship.user)

    visit users_path

    click_on 'add friend'

    expect(page).to have_content "already friends with #{friendship.friend.username}"
  end
end

