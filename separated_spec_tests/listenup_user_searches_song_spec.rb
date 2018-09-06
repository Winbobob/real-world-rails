require 'rails_helper'

feature "user can search for songs and see Spotify iframe results", %q{
  As a User
  I want to search for songs to listen to from the web application
} do

  # Acceptance Criteria
  #
  # - I must search for a song or artist name
  # - I am redirected to search results page
  # - I see Spotify iframes of potenial songs that match my search

  scenario "user searches for song that has potenial matches" do

    visit root_path

    fill_in "song, artist, album..", with: "Elton John"
    click_on "search!"


    expect(page).to have_content "Elton John"
    # - Verify iframe of song search exists
    page.has_css?('outerWidgetContainer')
    page.has_css?('art')
  end

  scenario "user searches for song that has no matches" do

    visit root_path

    fill_in "song, artist, album..", with: "f3f2fafda"
    click_on "search!"

    expect(page).to have_content "No results found - Search Again"

  end
end

