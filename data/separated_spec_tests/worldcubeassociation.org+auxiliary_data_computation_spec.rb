# frozen_string_literal: true

require 'rails_helper'
require 'auxiliary_data_computation'

RSpec.describe "AuxiliaryDataComputation" do
  describe ".compute_best_of_3_in_333bf" do
    def create_new_333bld_result(attributes = {})
      FactoryBot.build(:result, {
        eventId: "333bf", formatId: "3", roundTypeId: "c",
        value1: 3000, value2: 3000, value3: 3000, best: 3000,
        value4: SolveTime::SKIPPED_VALUE, value5: SolveTime::SKIPPED_VALUE,
        average: SolveTime::SKIPPED_VALUE # Average is not computed yet.
      }.merge(attributes)).tap do |result|
        result.save! validate: false # The average is not valid until we compute it.
      end
    end

    it "leaves average as skipped if one of three solves is skipped" 


    it "sets DNF average if one of three solves is either DNF or DNS" 


    it "sets a valid average if all three solves are completed" 


    it "rounds averages over 10 minutes to down to full seconds" 

  end

  describe ".compute_concise_results", clean_db_with_truncation: true do
    let(:person) { FactoryBot.create :person, countryId: "China" }
    let(:competition_2016) { FactoryBot.create :competition, starts: Date.parse("2016-04-04") }
    let(:next_competition_2016) { FactoryBot.create :competition, starts: Date.parse("2016-07-07") }
    let(:competition_2017) { FactoryBot.create :competition, starts: Date.parse("2017-08-08") }

    it "creates tables containing best results data for each person per event per year" 


    it "creates multiple entries for people that have switched country in the middle of a year" 

  end

  describe ".compute_rank_tables", clean_db_with_truncation: true do
    let(:australian) { FactoryBot.create :person, countryId: "Australia" }
    let(:canadian) { FactoryBot.create :person, countryId: "Canada" }
    let(:american_1) { FactoryBot.create :person, countryId: "USA" }
    let(:american_2) { FactoryBot.create :person, countryId: "USA" }

    def rank_333(person, ranks_type)
      person.public_send(ranks_type).find_by(eventId: "333").attributes.symbolize_keys
    end

    before do
      FactoryBot.create :result, eventId: "333", best: 600, average: 700, person: australian
      FactoryBot.create :result, eventId: "333", best: 700, average: 800, person: american_1
      FactoryBot.create :result, eventId: "333", best: 800, average: 900, person: canadian
      FactoryBot.create :result, eventId: "333", best: 900, average: 1000, person: american_2
    end

    it "computes world, continental, and national ranking position" 


    it "when a person changes country results from the previous region doesn't apply to the current one" 

  end
end

