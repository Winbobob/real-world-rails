require 'spec_helper'

describe 'Date picker', reset: false do
  before :all do
    Capybara.reset_sessions!
    load_page :search
  end

  context "range pickers" do
    context "when selecting a start date" do
      before :all do
        click_link 'Temporal'
        find('.temporal-range-start').click
        find('span.year', text: "2010").click
        find('span.month', text: "Jan").click
        find('td.day', text: "15").click
        js_click_apply ".temporal-dropdown"
      end

      after :all do
        reset_search
      end

      it "fills in 00:00:00 for the start time" 

    end

    context "when selecting an end date" do
      before :all do
        click_link 'Temporal'
        find('.temporal-range-stop').click
        find('span.year', text: "2010").click
        find('span.month', text: "Jan").click
        find('td.day', text: "15").click
        js_click_apply ".temporal-dropdown"
      end

      after :all do
        reset_search
      end

      it "fills in 23:59:59 for the end time" 

    end

    context "when typing an end date" do
      context "when typing a valid date" do
        before :all do
          click_link "Temporal"
          fill_in "End", with: "2010-01-15 12:13:14\t"
          js_click_apply ".temporal-dropdown"
        end

        after :all do
          reset_search
        end

        it "does not alter the end time" 

      end
    end

    context "when typing an invalid date" do
      before :all do
        click_link "Temporal"
        fill_in "Start", with: "gibberish\t"
      end

      after :all do
        js_click_clear
        click_link 'Temporal'
        reset_search
      end

      it "displays an error" 


      it "leaves the invalid date in the text field" 

    end
  end

  context "recurring pickers" do
    context "when selecting an end date" do
      before :all do
        click_link 'Temporal'
        js_check_recurring 'collection'
        find('.temporal-recurring-start').click
        find('span.month', text: "Jan").click
        find('td.day', text: "15").click
        find('.temporal-recurring-stop').click
        find('span.month', text: "Jan").click
        find('td.day', text: "20").click
        js_click_apply ".temporal-dropdown"
      end

      after :all do
        reset_search
        click_link 'Temporal'
        js_uncheck_recurring 'collection'
        js_click_apply ".temporal-dropdown"
      end

      it "fills in 23:59:59 for the end time" 

    end

    context "when typing an invalid date" do
      before :all do
        click_link "Temporal"
        js_check_recurring 'collection'
        fill_in "Start", with: "gibberish\t"
      end

      after :all do
        js_click_clear
        click_link 'Temporal'
        reset_search
        click_link 'Temporal'
        js_uncheck_recurring 'collection'
        js_click_apply ".temporal-dropdown"
      end

      it "displays an error" 


      it "leaves the invalid date in the text field" 


      context "and then selecting a valid date" do
        before :all do
          find('.temporal-recurring-start').click
          find('span.month', text: "Jan").click
          find('td.day', text: "15").click
        end

        it "displays the selected date" 

      end
    end
  end
end

