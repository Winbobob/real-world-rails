require File.expand_path("../../spec_helper", __FILE__)

describe INatAPIService do

  before :each do
    # stubbing HEAD
    stub_request(:head, /#{INatAPIService::ENDPOINT}/).
      to_return(status: 200, body: "", headers: {})
    # stubbing GET
    stub_request(:get, /#{INatAPIService::ENDPOINT}/).
      to_return(status: 200, body: '{"total_results": 9 }',
        headers: {"Content-Type" => "application/json"})
  end

  it "fetch observations" 


  it "fetch observations_observers" 


  it "fetch observations_species_counts" 


end

