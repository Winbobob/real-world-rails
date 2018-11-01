require 'rails_helper'

describe Cms::RecommendationsController do
  it { should use_before_action :set_activity_classification }
  it { should use_before_action :set_activity }
  it { should use_before_action :set_unit_templates }

  let(:user) { create(:staff) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe '#index' do
    let(:recommendations) { double(:recommendations) }
    let(:independent_recommendations) { double(:independent_recommendations) }
    let(:group_recommendations) { double(:group_recommendations) }
    let!(:activity) { create(:activity) }
    let!(:activity_classification) { create(:activity_classification) }

    before do
      allow(Recommendation).to receive(:includes) { double(:query, where: recommendations) }
      allow(Recommendation).to receive(:independent_practice) { double(:query1, where: independent_recommendations) }
      allow(Recommendation).to receive(:group_lesson) { double(:query2, where: group_recommendations) }
    end

    it 'should assign the normal, independent, and group recommendations' 

  end

  describe '#new' do
    let(:recommendation) { double(:recommendation) }
    let!(:concept) { create(:concept) }
    let!(:unit_template) { create(:unit_template) }
    let!(:activity) { create(:activity) }
    let!(:activity_classification) { create(:activity_classification) }


    before do
      allow(Recommendation).to receive(:new) { recommendation }
    end

    it 'should assign the concepts and recommendation' 

  end

  describe '#show' do
    let!(:activity) { create(:activity) }
    let!(:activity_classification) { create(:activity_classification) }
    let!(:recommendation) { create(:recommendation) }


    it 'should find the recommendation' 

  end

  describe '#create' do
    let!(:activity) { create(:activity) }
    let!(:activity_classification) { create(:activity_classification) }
    let!(:unit_template) { create(:unit_template) }

    context 'when the activity has recommendations and recommendation has a category' do
      let!(:recommendation) { create(:recommendation, activity: activity, category: 0) }

      it 'should create the recommendation with the given activity and order number greater than that of the category' 

    end


    it 'should create the recommendation with the given activity and next order number' 


    it 'should throw error if recommendation is not created' 

  end

  describe '#destroy' do
    let!(:activity) { create(:activity) }
    let!(:activity_classification) { create(:activity_classification) }
    let!(:recommendation) { create(:recommendation) }

    it 'should destroy the recommendation' 

  end
end

