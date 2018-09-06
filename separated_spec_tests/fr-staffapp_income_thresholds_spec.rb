require 'rails_helper'

RSpec.describe IncomeThresholds do
  subject(:service) { described_class.new(married, children) }

  describe '#min_threshold' do
    subject { service.min_threshold }

    context 'when the applicant is single without kids' do
      let(:married) { false }
      let(:children) { 0 }

      it 'calculates the right minimum threshold' 

    end

    context 'when the applicant is single with kids' do
      let(:married) { false }
      let(:children) { 2 }

      it 'calculates the right minimum threshold' 

    end

    context 'when the applicant is married without kids' do
      let(:married) { true }
      let(:children) { 0 }

      it 'calculates the right minimum threshold' 

    end

    context 'when the applicant is married with kids' do
      let(:married) { true }
      let(:children) { 2 }

      it 'calculates the right minimum threshold' 

    end
  end

  describe '#max_threshold' do
    subject { service.max_threshold }

    context 'when the applicant is single without kids' do
      let(:married) { false }
      let(:children) { 0 }

      it 'calculates the right minimum threshold' 

    end

    context 'when the applicant is single with kids' do
      let(:married) { false }
      let(:children) { 2 }

      it 'calculates the right minimum threshold' 

    end

    context 'when the applicant is married without kids' do
      let(:married) { true }
      let(:children) { 0 }

      it 'calculates the right minimum threshold' 

    end

    context 'when the applicant is married with kids' do
      let(:married) { true }
      let(:children) { 2 }

      it 'calculates the right minimum threshold' 

    end
  end
end

