require 'rails_helper'

describe Cms::CriteriaController do
  it { should use_before_action :set_activity }
  it { should use_before_action :set_recommendation }
  it { should use_before_action :set_activity_classification }
  it { should use_before_action :set_criterion }

  let(:user) { create(:staff) }

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe '#new' do
    let!(:activity_classification) { create(:activity_classification) }
    let!(:activity) { create(:activity) }
    let!(:recommendation) { create(:recommendation) }
    let(:criteria) { double(:criteria) }

    before do
      allow(Criterion).to receive(:new) { criteria }
    end
  
    it 'should give a new criteria' 

  end

  describe '#create' do
    let!(:activity_classification) { create(:activity_classification) }
    let!(:activity) { create(:activity) }
    let!(:recommendation) { create(:recommendation) }
    let!(:concept) { create(:concept) }

    it 'should create the criteria with the given params' 

  end

  describe '#update' do
    let!(:activity_classification) { create(:activity_classification) }
    let!(:activity) { create(:activity) }
    let!(:recommendation) { create(:recommendation) }
    let(:concept) { create(:concept) }
    let(:criterion) { create(:criterion, concept: concept, count: 1, no_incorrect: 2) }

    it 'should update the given criterion' 

  end

  describe '#destroy' do
    let!(:activity_classification) { create(:activity_classification) }
    let!(:activity) { create(:activity) }
    let!(:recommendation) { create(:recommendation) }
    let(:concept) { create(:concept) }
    let(:criterion) { create(:criterion, concept: concept, count: 1, no_incorrect: 2) }


    it 'should destroy the given criterion' 

  end
end

