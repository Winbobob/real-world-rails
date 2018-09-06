describe PostcodeLookupProxy do

  describe '.new' do
    context 'a valid postcode' do
      it 'should return be valid' 

    end

    context 'invalid postcode' do
      it 'should not be valid' 

    end
  end

  context '#lookup using dummy data' do
    it 'should return 422 if postcode invalid' 


    it 'should return 404 if postcode not found' 


    it 'should return 503 if timeout' 


    it 'should return 503 if credits run out' 


    it 'should return valid data set if valid' 

  end

  context 'country limited to England and Wales' do
    it 'should return success for English Postcode' 


    it 'should return 200/4041 for Scottish Address' 


  end

  context 'calls either development or production lookup' do
    it 'should call development lookup if not production' 


    it 'should call production lookup if use_live_data true' 


  end

  context 'logging', disable_cache: true  do
    it 'should call Logstuff with timeout false if no error' 


    it 'should call LogStuff with timeout true if there is a timeout' 

  end

  ##### - A test to check that we can connect to the real remote service - don't use in day-to-day testing

  # describe 'a real lookup to the api' do
  #   it 'should return a result or timeout' do
  #     WebMock.disable_net_connect!(:allow => [/api.ideal-postcodes.co.uk/, /codeclimate.com/] )
  #     pclp = PostcodeLookupProxy.new('SW109LB', true)
  #     expect(pclp).to be_valid
  #     result = pclp.lookup
  #     if result == true
  #       expect(pclp.empty?).to be false
  #     else
  #       expect(pclp.result_code).to eq 9001
  #     end
  #   end
  # end

end

def api_response
  %Q/{"result":[{"postcode":"ID1 1QD","postcode_inward":"1QD","postcode_outward":"ID1","post_town":"LONDON","dependant_locality":"","double_dependant_locality":"","thoroughfare":"Barons Court Road","dependant_thoroughfare":"","building_number":"2","building_name":"","sub_building_name":"","po_box":"","department_name":"","organisation_name":"","udprn":25962203,"postcode_type":"S","su_organisation_indicator":"","delivery_point_suffix":"1G","line_1":"2 Barons Court Road","line_2":"","line_3":"","premise":"2","country":"England","county":"","district":"Hammersmith and Fulham","ward":"North End","longitude":-0.208644362766368,"latitude":51.4899488390558,"eastings":524466,"northings":178299},{"postcode":"ID1 1QD","postcode_inward":"1QD","postcode_outward":"ID1","post_town":"LONDON","dependant_locality":"","double_dependant_locality":"","thoroughfare":"Barons Court Road","dependant_thoroughfare":"","building_number":"2","building_name":"Basement Flat","sub_building_name":"","po_box":"","department_name":"","organisation_name":"","udprn":52618355,"postcode_type":"S","su_organisation_indicator":"","delivery_point_suffix":"3A","line_1":"Basement Flat","line_2":"2 Barons Court Road","line_3":"","premise":"Basement Flat, 2","country":"England","county":"","district":"Hammersmith and Fulham","ward":"North End","longitude":-0.208644362766368,"latitude":51.4899488390558,"eastings":524466,"northings":178299}],"code":2000,"message":"Success"}/
end

def expected_result_set
  [
      {'address'=>'1 Melbury Close;;FERNDOWN',   'postcode'=>'BH22 8HR', 'country' => 'England' },
      {'address'=>'3 Melbury Close;;FERNDOWN',   'postcode'=>'BH22 8HR', 'country' => 'England' },
      {'address'=>'5 Melbury Close;;FERNDOWN',   'postcode'=>'BH22 8HR', 'country' => 'England' },
      {'address'=>'7 Melbury Close;;FERNDOWN',   'postcode'=>'BH22 8HR', 'country' => 'England' },
      {'address'=>'9 Melbury Close;;FERNDOWN',   'postcode'=>'BH22 8HR', 'country' => 'England' },
      {'address'=>'11 Melbury Close;;FERNDOWN',  'postcode'=>'BH22 8HR', 'country' => 'England' },
      {'address'=>'13 Melbury Close;;FERNDOWN',  'postcode'=>'BH22 8HR', 'country' => 'England' },
      {'address'=>'15 Melbury Close;;FERNDOWN',  'postcode'=>'BH22 8HR', 'country' => 'England' },
      {'address'=>'17 Melbury Close;;FERNDOWN',  'postcode'=>'BH22 8HR', 'country' => 'England' },
      {'address'=>'19 Melbury Close;;FERNDOWN',  'postcode'=>'BH22 8HR', 'country' => 'England' },
      {'address'=>'121 Melbury Close;;FERNDOWN', 'postcode'=>'BH22 8HR', 'country' => 'England' },
      {'address'=>'22 Melbury Close;;FERNDOWN',  'postcode'=>'BH22 8H', 'country' => 'England' },
      {'address'=>'23 Melbury Close;;FERNDOWN',  'postcode'=>'BH22 8HR', 'country' => 'England' }
  ]
end

def dummy_ideal_postcodes_result
  {
    "code" => 2000,
    "message" => "Success",
    "result" =>
    [
      { "address" => "2 Barons Court Road;;LONDON",
        "postcode" => "ID1 1QD",
        "country" => "England"
      },
      { "address" => "Basement Flat;;2 Barons Court Road;;LONDON",
        "postcode" => "ID1 1QD",
        "country" => "England"
      },
      { "address" => "4 Barons Court Road;;LONDON",
        "postcode" => "ID1 1QD",
        "country" => "England"
      },
      { "address" => "Basement;;4 Barons Court Road;;LONDON",
        "postcode" => "ID1 1QD",
        "country" => "England"
      },
      {"address" => "6 Barons Court Road;;LONDON",
        "postcode" => "ID1 1QD",
        "country" => "England"
      },
      { "address" => "8 Barons Court Road;;LONDON",
        "postcode" => "ID1 1QD",
        "country" => "England"
      },
      { "address" => "ID Consulting Limited;;59 Barons Court Road;;LONDON",
        "postcode" => "ID1 1QD",
        "country" => "England"
      }
    ]
  }
end

def scottish_result_set
  [
      {'address'=>'134, Corstorphine Road;;EDINBURGH', 'postcode'=>'EH12 6TS', 'country' => 'Scotland'},
      {'address'=>'Royal Zoological Society of Scotland;;134, Corstorphine Road;;EDINBURGH', 'postcode'=>'EH12 6TS', 'country' => 'Scotland'}
  ]
end


