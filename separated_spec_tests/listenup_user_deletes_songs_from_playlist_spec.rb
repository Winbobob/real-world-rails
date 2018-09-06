require 'rails_helper'

feature "user deletes any song that has been added to their playlist", %q{
  As a User
  I want to delete songs from my playlist that I no longer want
} do

  # Acceptance Criteria
  #
  # - I must be signed in
  # - I can delete any songs that have been added to my playlist
  # - I am given a message that song was deleted

  scenario "user deletes song from their playlist" do

    user = FactoryGirl.create(:user)

    sign_in_as(user)

    song = FactoryGirl.create(:song, user_id: user.id, added_by: user.username)

    visit "/users/#{user.username}"

    click_on 'delete'

    expect(page).to have_content "#{song.song_name} deleted from playlist"
  end
end

