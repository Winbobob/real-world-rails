require 'rails_helper'

describe Cms::ActivityClassificationsController, type: :controller do
  let(:user) { create(:staff) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe '#index' do
    let!(:classification) { create(:activity_classification) }
    let!(:classification1) { create(:activity_classification) }

    it 'should return all the activity classifications' 

  end

  describe '#create' do
    let(:classification) { build(:activity_classification) }

    it 'should create the activity classification with the given params' 

  end

  describe '#update' do
    let!(:classification) { create(:activity_classification) }

    it 'should update the classification with the params provided' 

  end

  describe '#update_order_numbers' do
    let!(:classification) { create(:activity_classification) }

    it 'should update the classification with the params provided' 

  end

  describe '#destroy' do
    let!(:classification) { create(:activity_classification) }

    it 'should destroy the given classification' 

  end
end

