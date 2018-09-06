describe DatedFeed do

  describe '#strptime_in_time_zone' do
    let(:bearfacts_date_format) {'%A %m/%d/%y %I:%M %p'}
    subject {DatedFeed.strptime_in_time_zone(bearfacts_date_time, bearfacts_date_format)}
    context 'during daylight savings' do
      let(:bearfacts_date_time) {'Monday 04/08/13 09:30 AM'}
      it 'can parse BearFacts XML time to proper Pacific time' 

      it 'can parse BearFacts XML time as UTC as well' 

    end
    context 'during standard time' do
      let(:bearfacts_date_time) {'Monday 12/09/13 09:00 AM'}
      it 'can parse BearFacts XML time to proper Pacific time' 

      it 'can parse BearFacts XML time as UTC as well' 

    end
  end

end

