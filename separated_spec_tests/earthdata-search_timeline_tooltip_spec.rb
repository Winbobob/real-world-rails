require 'spec_helper'

describe "Timeline tooltip", reset: false, pending_updates: true do
  before :all do
    Capybara.reset_sessions!
    page.driver.resize_window(1280, 1024)
    load_page :search, project: ['C179003030-ORNL_DAAC'], view: :project
    pan_timeline(-16.days)
    wait_for_xhr
  end

  context "when viewing month zoom level" do
    it "displays a tooltip for timeline data" 

  end

  context "when viewing year zoom level" do
    before :all do
      find('.timeline-zoom-out').click
      wait_for_xhr
    end

    after :all do
      find('.timeline-zoom-in').click
      wait_for_xhr
    end

    it "displays a tooltip for timeline data" 

  end

  context "when viewing decade zoom level" do
    before :all do
      find('.timeline-zoom-out').click
      find('.timeline-zoom-out').click
      wait_for_xhr
    end

    after :all do
      find('.timeline-zoom-in').click
      find('.timeline-zoom-in').click
      wait_for_xhr
    end

    it "displays a tooltip for timeline data" 

  end

  context "when viewing day zoom level" do
    before :all do
      find('.timeline-zoom-in').click
      wait_for_xhr
    end

    after :all do
      find('.timeline-zoom-out').click
      wait_for_xhr
    end

    it "displays a tooltip for timeline data" 

  end
end

