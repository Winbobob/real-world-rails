# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Sign up" do
  let!(:person) { FactoryBot.create(:person_who_has_competed_once, year: 1988, month: 2, day: 3) }
  let!(:person_without_dob) { FactoryBot.create :person, year: 0, month: 0, day: 0 }
  let!(:custom_delegate) { FactoryBot.create(:delegate) }

  context 'when signing up as a returning competitor', js: true do
    it 'disables sign up button until the user selects "have competed"' 


    it 'finds people by name' 


    it "remembers that they have competed before on validation error" 


    it "remembers their selected wca id on validation error" 


    it "remembers their selected wca id and custom delegate on validation error" 

  end

  context 'when signing up as a first time competitor', js: true do
    it 'can sign up' 


    it "remembers that they have not competed before on validation error" 

  end

  context "changing between noobie and have competed", js: true do
    it "disables previous competitor fields when signing up as a noobie" 


    it "disables noobie fields when signing up as a previous competitor" 

  end

  context "changing have competed and noobie", js: true do
    it "does not leak birthdate information" 

  end
end

