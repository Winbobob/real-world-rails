# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Metrics::Utils::AbcSizeCalculator do
  describe '#calculate' do
    context '0 assignments, 3 branches, 0 conditions' do
      it 'returns 3' 

    end

    context '2 assignments, 6 branches, 2 conditions' do
      it 'returns 6.63' 

    end

    context '2 assignments, 8 branches, 3 conditions' do
      it 'returns 8.77' 

    end
  end
end

