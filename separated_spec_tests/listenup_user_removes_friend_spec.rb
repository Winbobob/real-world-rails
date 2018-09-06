require 'rails_helper'

feature "user can remove friends", %q{
  As a User
  I want to be remove friends.
} do

  # Acceptance Criteria
  #
  # - I must be signed in
  # - I can click a remove link to remove friendship from my page
  # - I am given a message friendship has been removed

  scenario "user removes friendship" do

    friendship = FactoryGirl.create(:friendship)

    sign_in_as(friendship.user)

    visit "users/#{friendship.user.username}"

    click_on 'remove'

    expect(page).to have_content "removed friendship"
  end
end

