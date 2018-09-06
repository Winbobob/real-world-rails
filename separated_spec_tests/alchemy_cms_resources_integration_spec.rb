# frozen_string_literal: true

require 'spec_helper'

describe "Resources" do
  let(:event)        { create(:event) }
  let(:second_event) { create(:event, name: 'My second Event', entrance_fee: 12.32) }

  before { authorize_user(:as_admin) }

  describe "index view" do
    it "should have a button for creating a new resource items" 


    it "should list existing items" 


    it "should list existing resource-items nicely formatted" 

  end

  describe "form for creating and updating items" do
    it "renders an input field according to the attribute's type" 


    it "should have a select box for associated models" 

  end

  describe "create resource item" do
    context "when form filled with valid data" do
      let!(:location) { create(:location) }

      before do
        visit '/admin/events/new'
        fill_in 'event_name', with: 'My second event'
        fill_in 'event_starts_at', with: Time.local(2012, 03, 03, 20, 00)
        select location.name, from: 'Location'
        click_on 'Save'
      end

      it "lists the new item" 


      it "shows a success message" 

    end

    context "when form filled with invalid data" do
      before do
        visit '/admin/events/new'
        fill_in 'event_name', with: '' # invalid!
        click_on 'Save'
      end

      it "shows the form again" 


      it "lists invalid fields" 


      it "should not display success notice" 

    end
  end

  describe "updating an item" do
    before do
      visit("/admin/events/#{event.id}/edit")
      fill_in 'event_name', with: 'New event name'
      click_on 'Save'
    end

    it "shows the updated value" 


    it "shows a success message" 

  end

  describe "destroying an item" do
    before do
      event
      second_event
      visit '/admin/events'
      within('tr', text: 'My second Event') do
        click_on 'Delete'
      end
    end

    it "shouldn't be on the list anymore" 


    it "should display success message" 

  end

  context "with event that acts_as_taggable" do
    it "shows an autocomplete tag list in the form" 


    context "with tagged events in the index view" do
      let!(:event)        { create(:event, name: "Casablanca", tag_list: "Matinee") }
      let!(:second_event) { create(:event, name: "Die Hard IX", tag_list: "Late Show") }

      before { visit "/admin/events" }

      it "shows the tag filter sidebar" 


      it "filters the events when clicking a tag", aggregate_failures: true do
        click_link "Matinee"
        expect(page).to have_content("Casablanca")
        expect(page).to_not have_content("Die Hard IX")

        # Keep the tags when editing an event
        click_link "Edit"
        click_button "Save"
        expect(page).to have_content("Casablanca")
        expect(page).to_not have_content("Die Hard IX")
      end
    end
  end

  context "with event that has filters defined" do
    let!(:past_event) { create(:event, name: "Horse Expo", starts_at: Time.current - 100.years) }
    let!(:today_event) { create(:event, name: "Car Expo", starts_at: Time.current.at_noon) }
    let!(:future_event) { create(:event, name: "Hovercar Expo", starts_at: Time.current + 30.years) }

    it "lets the user filter by the defined scopes", aggregate_failures: true do
      visit "/admin/events"
      within "#library_sidebar" do
        expect(page).to have_content("Starting today")
        expect(page).to have_content("Future")
      end

      # Here we visit the pages manually, as we don't want to test the JS here.
      visit "/admin/events?filter=starting_today"
      expect(page).to     have_content("Car Expo")
      expect(page).to_not have_content("Hovercar Expo")
      expect(page).to_not have_content("Horse Expo")

      visit "/admin/events?filter=future"
      expect(page).to     have_content("Hovercar Expo")
      expect(page).to_not have_content("Car Expo")
      expect(page).to_not have_content("Horse Expo")

      # Keep the filter when editing an event
      click_link "Edit"
      click_button "Save"
      expect(page).to     have_content("Hovercar Expo")
      expect(page).to_not have_content("Car Expo")
      expect(page).to_not have_content("Horse Expo")
    end

    it "does not work with undefined scopes" 

  end
end

