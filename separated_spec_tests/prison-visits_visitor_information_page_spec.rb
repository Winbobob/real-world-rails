require 'poltergeist_helper'

RSpec.feature "visitor enters visitor information" do
  include FeaturesHelper

  before :each do
    visit edit_prisoner_details_path
    enter_prisoner_information
  end

  context "and leaves fields blank" do
    it "validation messages are present" 

  end

  context "and they fill out all fields" do
    context "for one visitor" do
      it "displays the calendar" 

    end

    (1..5).each do |n|
      context "for #{n} additional visitors" do
        it "displays the calendar" 

      end
    end
  end

  context "and they are defined by age" do

    it "indicates they are over the specified age for a seat" 


    it "indicates they are under the specified age for a seat" 


  end
end

