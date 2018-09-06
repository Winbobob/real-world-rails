describe CourtfinderController, type: :controller do
  describe '#address' do
    context 'when a valid postcode is given' do
      let(:postcode) { 'SG8 0LT' }
      # let(:json) { court_address }

      before do
        allow_any_instance_of(Courtfinder::Client::HousingPossession).to \
          receive(:get).and_return(court_address)
      end

      it 'should return the correct response code' 


      it 'should return valid JSON' 

    end

    context 'when a invalid postcode is given' do
      let(:postcode) { 'fake' }

      before do
        allow_any_instance_of(Courtfinder::Client::HousingPossession).to \
          receive(:get).and_return('')
      end

      it 'should return error status code' 


      it 'should return error message' 

    end

    context 'when error is returned' do
      let(:postcode) { 'foo bar' }
      let(:json_error) { { "error" => "Timeout" } }

      before do
        allow_any_instance_of(Courtfinder::Client::HousingPossession).to \
          receive(:get).and_return(json_error)
      end

      it 'should log the error' 


      it 'should return expected result' 

    end
  end
end

