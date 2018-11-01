require 'rails_helper'

RSpec.describe EstablishmentsController, type: :controller do
  describe 'GET index' do
    let(:crown_courts) { create_list(:establishment, 2, :crown_court) }
    let(:magistrates_courts) { create_list(:establishment, 5, :magistrates_court) }
    let(:prisons) { create_list(:establishment, 4, :prison) }
    let(:hospitals) { create_list(:establishment, 3, :hospital) }
    let!(:establishments) { crown_courts + magistrates_courts + prisons + hospitals }

    it 'returns the list of all available establishments' 


    context 'when a category filter is set to crown courts only' do
      let(:category) { 'crown_court' }

      it 'returns only the list of crown court establishments' 

    end

    context 'when a category filter is set to magistrates courts only' do
      let(:category) { 'magistrates_court' }

      it 'returns only the list of magistrates court establishments' 

    end

    context 'when a category filter is set to prisons only' do
      let(:category) { 'prison' }

      it 'returns only the list of prison establishments' 

    end

    context 'when a category filter is set to hospitals only' do
      let(:category) { 'hospital' }

      it 'returns only the list of hospital establishments' 

    end

    context 'when a category filter is set to an invalid category' do
      let(:category) { 'invalid_category' }

      it 'returns an empty list of establishments' 

    end
  end
end

