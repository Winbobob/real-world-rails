require 'spec_helper'

describe ConversationalDevelopmentIndex::MetricPresenter do
  subject { described_class.new(metric) }
  let(:metric) { build(:conversational_development_index_metric) }

  describe '#cards' do
    it 'includes instance score, leader score and percentage score' 

  end

  describe '#idea_to_production_steps' do
    it 'returns percentage score when it depends on a single feature' 


    it 'returns percentage score when it depends on two features' 

  end

  describe '#average_percentage_score' do
    it 'calculates an average value across all the features' 

  end
end

