require 'rails_helper'

RSpec.describe Jadu::API::ParsedResponse do
  let(:response) do
    instance_double Net::HTTPResponse,
      body: '{"feeGroupReference":"991000185700","status":"ok"}'
  end

  describe '#ok?' do
    it 'is OK if the status was 200' 


    it 'is not OK if the status was not 200' 

  end

  it '#[]' 


  it '#values_at' 


  it '#to_h' 

end

