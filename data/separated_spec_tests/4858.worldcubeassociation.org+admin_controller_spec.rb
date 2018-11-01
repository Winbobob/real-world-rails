# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  describe 'GET #index' do
    context 'when not signed in' do
      it 'redirects to the sign in page' 

    end

    context 'when signed in as a delegate' do
      sign_in { FactoryBot.create :delegate }

      it 'redirects to the root page' 

    end

    context 'when signed in as an admin' do
      sign_in { FactoryBot.create :admin }

      it 'shows the index page' 

    end
  end

  describe 'merge_people' do
    sign_in { FactoryBot.create :admin }

    let(:person1) { FactoryBot.create(:person) }
    let(:person2) { FactoryBot.create(:person, person1.attributes.symbolize_keys!.slice(:name, :countryId, :gender, :year, :month, :day)) }

    it 'can merge people' 

  end

  describe 'PATCH #update person' do
    sign_in { FactoryBot.create :admin }

    let(:person) { FactoryBot.create(:person_who_has_competed_once, name: "Feliks Zemdegs", countryId: "Australia") }

    it "shows a message with link to the check_regional_record_markers script if the person has been fixed and countryId has changed" 


    it "shows a successful message when the person has been changed" 

  end
end

