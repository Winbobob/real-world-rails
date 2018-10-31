require 'spec_helper'

module Spree
  module Core
    describe QueryFilters::Comparable do
      let(:subject) do
        described_class.new(attribute: Spree::DummyModel.arel_table[:position])
      end

      let!(:dummy1) { Spree::DummyModel.create(name: '1', position: 3) }
      let!(:dummy2) { Spree::DummyModel.create(name: '2', position: 10) }
      let!(:dummy3) { Spree::DummyModel.create(name: '3', position: 4) }
      let(:scope) { Spree::DummyModel.all }

      context 'with greater than matcher' do
        let(:filter) do
          {
            position: { gt: 3 }
          }
        end

        it 'returns correct dummies' 

      end

      context 'with greater than or equal matcher' do
        let(:filter) do
          {
            position: { gteq: 4 }
          }
        end

        it 'returns correct dummies' 

      end

      context 'with lower than matcher' do
        let(:filter) do
          {
            position: { lt: 4 }
          }
        end

        it 'returns correct dummies' 

      end

      context 'with lower than or equal matcher' do
        let(:filter) do
          {
            position: { lteq: 4 }
          }
        end

        it 'returns correct dummies' 

      end
    end
  end
end

