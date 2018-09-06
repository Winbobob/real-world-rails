# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Claim WCA ID" do
  let!(:user) { FactoryBot.create(:user) }
  let!(:person) { FactoryBot.create(:person_who_has_competed_once, year: 1988, month: 2, day: 3) }
  let!(:person_without_dob) { FactoryBot.create :person, year: 0, month: 0, day: 0 }

  context 'when signed in as user without wca id', js: true do
    before :each do
      sign_in user
    end

    it 'can claim WCA ID' 


    it 'tells you to contact Results team if your WCA ID does not have a birthdate' 

  end
end

