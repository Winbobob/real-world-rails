require 'spec_helper'

describe PostcodesController, pending: 'controller not used anymore' do

  describe "GET 'repossession'" do

    let!(:court) { create(:court, cci_code: 10) }
    let!(:postcode_court) { create(:postcode_court, court: court) }

    it 'returns http success' 


    it 'returns headings' 


    it 'returns correct data' 


    it 'returns a question mark for no cci_number' 

  end

end

