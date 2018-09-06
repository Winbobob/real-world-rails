require 'spec_helper'

describe EntityDateHelper do
  let(:date_helper_class) { Class.new { include EntityDateHelper }.new }

  it 'converts 0 seconds' 


  it 'converts 40 seconds' 


  it 'converts 60 seconds' 


  it 'converts 70 seconds' 


  it 'converts 3600 seconds' 


  it 'converts 3750 seconds' 


  it 'converts 86400 seconds' 


  it 'converts 86560 seconds' 


  it 'converts 86760 seconds' 


  it 'converts 986760 seconds' 


  describe '#remaining_days_in_words' do
    around do |example|
      Timecop.freeze(Time.utc(2017, 3, 17)) { example.run }
    end

    context 'when less than 31 days remaining' do
      let(:milestone_remaining) { date_helper_class.remaining_days_in_words(build_stubbed(:milestone, due_date: 12.days.from_now.utc)) }

      it 'returns days remaining' 

    end

    context 'when less than 1 year and more than 30 days remaining' do
      let(:milestone_remaining) { date_helper_class.remaining_days_in_words(build_stubbed(:milestone, due_date: 2.months.from_now.utc)) }

      it 'returns months remaining' 

    end

    context 'when more than 1 year remaining' do
      let(:milestone_remaining) { date_helper_class.remaining_days_in_words(build_stubbed(:milestone, due_date: (1.year.from_now + 2.days).utc)) }

      it 'returns years remaining' 

    end

    context 'when milestone is expired' do
      let(:milestone_remaining) { date_helper_class.remaining_days_in_words(build_stubbed(:milestone, due_date: 2.days.ago.utc)) }

      it 'returns "Past due"' 

    end

    context 'when milestone has start_date in the future' do
      let(:milestone_remaining) { date_helper_class.remaining_days_in_words(build_stubbed(:milestone, start_date: 2.days.from_now.utc)) }

      it 'returns "Upcoming"' 

    end

    context 'when milestone has start_date in the past' do
      let(:milestone_remaining) { date_helper_class.remaining_days_in_words(build_stubbed(:milestone, start_date: 2.days.ago.utc)) }

      it 'returns days elapsed' 

    end
  end
end

