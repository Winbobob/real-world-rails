# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PersonsController, type: :controller do
  describe "GET #index" do
    it "responds to HTML request successfully" 


    # See section titled "InnoDB Full-Text Index Transaction Handling"
    # on https://dev.mysql.com/doc/refman/5.7/en/innodb-fulltext-index.html.
    # "a FULLTEXT search can only see committed data", which means that
    # we cannot run these tests inside of a transaction (as is the default).
    context "Ajax request", clean_db_with_truncation: true do
      let!(:person1) { FactoryBot.create(:person, name: "Jennifer Lawrence", countryId: "USA", wca_id: "2016LAWR01") }
      let!(:person2) { FactoryBot.create(:person, name: "Benedict Cumberbatch", countryId: "United Kingdom", wca_id: "2016CUMB01") }
      let!(:competition) { FactoryBot.create(:competition) }
      let!(:result) { FactoryBot.create(:result, pos: 1, roundTypeId: "f", competitionId: competition.id, person: person1) }

      it "responds with correct JSON when region and search are specified" 


      it "selecting continent works" 


      it "searching by WCA ID works" 


      it "works well when parts of the name are given" 

    end
  end
end

