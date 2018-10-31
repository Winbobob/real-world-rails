require 'rails_helper'

RSpec.describe DateHelper do
  describe '.format_date_of_birth' do
    it 'formats a date from a date' 

    it 'formats a date from a string' 

  end

  describe '.format_date' do
    it 'formats a day from a string' 

    it 'formats a day from a date' 

  end

  describe '.format_time_12hr' do
    it 'formats a 24hr time string into a 12hr clock format' 

  end

  describe '.format_time_24hr' do
    it 'formats a 24hr time string with a separator between hours & minutes' 

  end

  describe '.date_and_duration_of_slot' do
    let(:slot) { Slot.new(date: '2015-11-5', times: '1330-1430') }
    it 'displays the date and the time and duration of a slot' 

  end

  describe '.date_and_times_of_slot' do
    let(:slot) { Slot.new(date: '2015-11-5', times: '1330-1430') }
    it 'displays the date and the time of a slot' 

  end
end

