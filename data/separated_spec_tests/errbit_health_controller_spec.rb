describe "Health", type: 'request' do
  let(:errbit_app) { Fabricate(:app, api_key: 'APIKEY') }

  describe "readiness" do
    it 'can let you know when the app is ready to receive requests' 


    it 'can indicate if a check fails' 

  end

  describe "liveness" do
    it 'can let you know that the app is still alive' 

  end

  describe "api_key_tester" do
    it 'will let you know when the api_key is not valid' 


    it 'can let you know that the api_key is valid' 

  end
end

