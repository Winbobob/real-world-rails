require 'rails_helper'

feature "user searches song and adds to friends playlists", %q{
  As a User
  I want to search for songs to add to friends playlists for them to hear
} do

  # Acceptance Criteria
  #
  # - I must search for a song or artist name
  # - I am redirected to search results page
  # - I see Spotify iframes of potenial songs that match my search
  # - I select friends that I want to place song in their playlist

  scenario "user searches for song and adds to friends playlist" do
    visit root_path
    friendship = FactoryGirl.create(:friendship)

    sign_in_as(friendship.user)
    fill_in "song, artist, album..", with: "Elton John"
    click_on "search!"



    within('.song-1') do
      check 'user_ids_'
      click_on 'add'
    end

    expect(page).to have_content "added to playlists!"

    # visit "/users/#{user2.username}"


    # expect(page).to have_content "#{user2.username}"
    # expect(page).to have_content "added by: #{user1.username}"

  end
end

