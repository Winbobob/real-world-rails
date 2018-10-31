# frozen_string_literal: true

describe DateTimeHelper do
  describe '#format_date' do
    context 'MM/DD/YYY format' do
      let(:date_str) { '01/14/2019' }
      it 'returns formatted value' 

    end

    context 'DD/MM/YYY format' do
      let(:date_str) { '30/07/2019' }
      it 'returns formatted value' 

    end
  end

  describe '#format_time' do
    context '12 hour format' do
      let(:time_str) { '1:00pm' }
      it 'returns formatted value' 

    end

    context '24 hour format' do
      let(:time_str) { '24:00' }
      it 'returns formatted value' 

    end
  end
end

