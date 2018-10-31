describe PostcodeLookupProxyController, :type => :controller do

  describe "show" do

    before(:all) do
      @result_set = YAML.load_file("#{Rails.root}/config/dummy_postcode_results.yml")
      setenv 'demo'
    end

    after(:all) { resetenv }

    before(:example) do
      allow(controller).to receive(:live_postcode_lookup?).and_return(false)
    end

    context 'a valid postcode' do
      it "should render the result set" 

    end

    context 'an invalid postcode' do
      it "should render 'invalid postcode'" 

    end

    context 'an empty dataset' do
      it "should render 'No matching postcodes'" 

    end

    context 'a remote timeout or failure' do
      it 'should return status service unavailable (503)' 

    end

    context 'a scottish postcode which is allowed' do
      it 'should call proxy with and emtpy array and return a valid set of addresses' 

    end

    context 'a scottish postcode which is not allowed' do
      it 'should return 200 with 9404 result code and scotland as message' 

    end
  end

  describe 'live_postcode_lookup' do

    # This test queries the live server and so should be used in normal day to day usage, but is
    # here if there is a question over what the live server actually returns
    #
    if ENV['LIVEPC'] == 'idealpostcodes'
      context 'with livepc in url' do
        before(:each) do
          allow(request).to receive(:referer).and_return('https://civilclaims.service.gov.uk/accelerated-possession-eviction?journey=4&livepc=1')
        end

        it 'should return true for demo environments' 


        it 'should return true for staging environments' 


        it 'should return true for production environments' 

      end
    end

    context 'with no livepc in the url' do

      let(:postcode)        { 'RG2 7PU' }
      let(:all_countries)   { ['All'] }
      let(:pclp)            { double PostcodeLookupProxy }

      before(:each) do
        allow(request).to receive(:referer).and_return('https://civilclaims.service.gov.uk/accelerated-possession-eviction?journey=4')
      end

      it 'should return false for demo environments' 


      # This test queries the live server and so should be used in normal day to day usage, but is
      # here if there is a question over what the live server actually returns
      #
      if ENV['LIVEPC'] == 'idealpostcodes'

        it 'should return true for staging environments' 


        it 'should return true for production environments' 

      end
    end
  end
end

def setenv(env)
  ENV['ENV_NAME'] = env
end

def resetenv
  ENV['ENV_NAME'] = nil
end

def set_referer_url_with_use_live_postcode_lookup_param
  allow(request).to receive(:referer).and_return('https://civilclaims.service.gov.uk/accelerated-possession-eviction?journey=4&livepc=1')
end

def set_referer_url_without_use_live_postcode_lookup_param
  allow(request).to receive(:referer).and_return('https://civilclaims.service.gov.uk/accelerated-possession-eviction?journey=4')
end

# def expect_postcode_lookup_to_be_called_with(postcode, *flags)
#   pclp = double(PostcodeLookupProxy).as_null_object
#   expect(PostcodeLookupProxy).to receive(:new).with(postcode, *flags).and_return(pclp)
#   allow(pclp).to receive(:result_set).and_return('xxx')
#   allow(pclp).to receive(:http_status).and_return(200)
# end

def scottish_response
  {
    'code'    => 2000,
    'message' => 'Success',
    'result'  => [
      {'address'=>'134, Corstorphine Road;;EDINBURGH', 'postcode'=>'EH12 6TS', 'country' => 'Scotland'},
      {'address'=>'Royal Zoological Society of Scotland;;134, Corstorphine Road;;EDINBURGH', 'postcode'=>'EH12 6TS', 'country' => 'Scotland'}
    ]
  }.to_json
end

def expected_response
  {
    'code'    => 2000,
    'message' => 'Success',
    'result'  => [
      {'address'=>'150 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'152 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'154 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'156 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'158 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'160 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'162 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'164 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'166 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'168 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'170 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'172 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'174 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'176 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'178 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'180 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'182 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'184 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'186 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'188 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'190 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'},
      {'address'=>'192 Northumberland Avenue;;READING', 'postcode'=>'RG2 7PU', 'country' => 'England'}
    ]
  }.to_json
end

