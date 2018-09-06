# EDSC-28 As a user, I want to see a primary interface focused on a map so that
#         I may focus on the spatial aspects of my searches and results
# EDSC-29 As a user, I want to select alternate layers for the map so that I may
#         have better context for my search
# EDSC-30 As a user, I want to select alternate map projections so that I may
#         view areas of interest commonly distorted by default projections

require "spec_helper"

describe "Map interface", reset: false do
  before do
    load_page :search, overlay: false
  end

  let (:switcher_selector) { '#map .projection-switcher' }
  let (:north_text) { 'North Polar Stereographic' }
  let (:north_link) { within(switcher_selector) {find_link(north_text)} }
  let (:geo_text) { 'Geographic (Equirectangular)' }
  let (:geo_link) { within(switcher_selector) {find_link(geo_text)} }
  let (:south_text) { 'South Polar Stereographic' }
  let (:south_link) { within(switcher_selector) {find_link(south_text)} }

  shared_browser_session do
    it "displays the whole Earth centered in plate carree projection on the main page" 


    it "displays enabled zoom controls" 

  end

  # This is a hack.  See https://github.com/thoughtbot/capybara-webkit/issues/494
  # Places where this is used have been tested as working in Selenium but are
  # broken in capybara-webkit.  This sends a fake click using Javascript
  context "projection switching" do
    it "displays controls to switch between north pole, south pole, and global projections" 


    it "allows switching to north polar stereographic projection and back" 


    it "allows switching to south polar stereographic projection and back" 


    it "disables the current projection" 

  end

  context "layer switcher" do
    it "presents base and overlay layers on mouse hover" 


    it "allows switching base layers" 


    it "draws overlay layers on top of the base layer" 

  end
end

