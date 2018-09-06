require 'rails_helper'

feature "user searches song and adds to their own playlist", %q{
  As a User
  I want to search for songs and add to my playlist
} do

  # Acceptance Criteria
  #
  # - I must search for a song or artist name
  # - I am redirected to search results page
  # - I see Spotify iframes of potenial songs that match my search
  # - I select song and add to my playlist

  scenario "user searches for song and adds to their own playlist" do
    visit root_path
    user = FactoryGirl.create(:user)

    sign_in_as(user)


    fill_in "song, artist, album..", with: "Elton John"
    click_on "search!"

    within('.song-1') do
     click_on "add to my playlist"
    end

    expect(page).to have_content user.username
    expect(page).to have_content "added by: #{user.username}"
  end
end

