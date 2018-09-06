describe BackgroundJob do
  describe '.unique_job_id' do
    before do
      allow(DateTime).to receive(:now).and_return(DateTime.parse("2017-02-03T14:37:18-08:00"))
      allow(SecureRandom).to receive(:hex).and_return('67f4b934525501cb', '15fb56bedaa3b437')
    end

    it 'returns unique job id based on current time' 


    it 'raises exception if unique id not found after 15 attempts' 

  end

  describe '.find' do
    it 'returns the current job object from global storage' 


    it 'returns nil if job state not found' 

  end
end

