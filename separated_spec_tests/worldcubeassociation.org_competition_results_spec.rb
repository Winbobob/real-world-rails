# frozen_string_literal: true

require "rails_helper"

RSpec.feature "competition results" do
  let(:competition) { FactoryBot.create :competition, :confirmed, :visible, events: Event.where(id: '333'), results_posted_at: 1.day.ago }
  let(:person_1) { FactoryBot.create :person, name: "Fast Cuber", countryId: "USA" }
  let(:person_2) { FactoryBot.create :person, name: "Slow Cuber", countryId: "USA" }

  let!(:result_1) { FactoryBot.create :result, competition: competition, eventId: "333", roundTypeId: "c", pos: 1, person: person_1 }
  let!(:result_2) { FactoryBot.create :result, competition: competition, eventId: "333", roundTypeId: "c", pos: 2, person: person_2 }

  describe "winners" do
    it "displays the winners for each event" 

  end

  describe "by person" do
    it "displays the results for each person" 

  end

  describe "all results" do
    it "displays the results for each person" 

  end

  describe "podiums" do
    it "lists the first three" 

  end
end

