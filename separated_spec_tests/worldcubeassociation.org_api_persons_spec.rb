# frozen_string_literal: true

require "rails_helper"

RSpec.describe "API Persons" do
  let!(:person) { FactoryBot.create :person }

  describe "GET #index" do
    let!(:other_people) { FactoryBot.create_list :person, 3 }

    it "renders properly" 


    it "renders a person with multiple sub ids once" 


    context "when a list of WCA IDs is given" do
      it "renders only people having one of these ids" 

    end
  end

  describe "GET #show" do
    it "renders properly" 


    it "includes personal records in the response" 

  end
end

