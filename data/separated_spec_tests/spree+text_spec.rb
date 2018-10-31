require 'spec_helper'

module Spree
  module Core
    describe QueryFilters::Text do
      let(:subject) do
        described_class.new(attribute: Spree::DummyModel.arel_table[:name])
      end

      let!(:dummy1) { Spree::DummyModel.create(name: 'TestName', position: 3) }
      let!(:dummy2) { Spree::DummyModel.create(name: 'Test', position: 10) }
      let!(:dummy3) { Spree::DummyModel.create(name: 'Something', position: 4) }
      let(:scope) { Spree::DummyModel.all }

      context 'with eq matcher' do
        let(:filter) do
          {
            position: { eq: 'TestName' }
          }
        end

        it 'returns correct dummies' 

      end

      context 'with contains matcher' do
        let(:filter) do
          {
            position: { contains: 'Test' }
          }
        end

        it 'returns correct dummies' 

      end
    end
  end
end

