require 'spec_helper'

# Testing the monkey patches here
describe Range do
  it 'intersects times' 


  it 'intersects dates' 


  it 'intersects date and time' 


  context 'to_date_range' do
    context 'when date range supplied' do
      it 'returns a copy of the same range' 

    end

    context 'when a range with strings is supplied' do
      it 'parses the strings as dates' 

    end

    context 'when a time range is supplied where the max time is at midnight' do
      it 'returns a date which excludes the max\' date (and thus only includes elapsed days)' 

    end

    context 'when a time range is supplied where the max time is after midnight' do
      it 'returns a date which includes the max\' date (and thus only includes elapsed days)' 

    end
  end

  context 'to_time_range' do
    context 'when date range supplied' do
      it 'handles the max date as including and returns a time range in the current time zone' 

    end

    context 'when a range with strings is supplied' do
      it 'parses the strings as times' 

    end

    context 'when a time range is supplied' do
      it 'returns a copy of the same range' 

    end
  end
end

