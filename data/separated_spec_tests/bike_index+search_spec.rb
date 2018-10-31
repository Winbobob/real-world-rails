require 'spec_helper'

describe 'Search API V3' do
  # For the time being, only count is implemented
  let(:manufacturer) { FactoryGirl.create(:manufacturer) }
  let(:color) { FactoryGirl.create(:color) }
  describe '/' do
    let!(:bike) { FactoryGirl.create(:bike, manufacturer: manufacturer) }
    let!(:bike_2) { FactoryGirl.create(:stolen_bike, manufacturer: manufacturer) }
    let(:query_params) { { query_items: [manufacturer.search_id] } }
    context 'with per_page' do
      it 'returns matching bikes, defaults to stolen' 

    end
  end
  describe '/close_serials' do
    let!(:bike) { FactoryGirl.create(:bike, manufacturer: manufacturer, serial_number: 'something') }
    let(:query_params) { { serial: 'somethind', stolenness: 'non' } }
    let(:target_interpreted_params) { Bike.searchable_interpreted_params(query_params, ip: nil) }
    context 'with per_page' do
      it 'returns matching bikes, defaults to stolen' 

    end
  end
  describe '/count' do
    context 'incorrect stolenness value' do
      it 'returns an error message' 

    end
    context "correct params" do
      let(:request_query_params) do
        {
          serial: "s",
          manufacturer: manufacturer.id,
          color_ids: [color.id],
          location: "Chicago, IL",
          distance: 20,
          stolenness: "stolen"
        }
      end
      let(:proximity_query_params) { request_query_params.merge(stolenness: "proximity") }
      let(:proximity_interpreted_params) { Bike.searchable_interpreted_params(proximity_query_params, ip: "") }
      # Use the interpreted params, because they come with proximity data - it"s what we do in the API
      let(:stolen_interpreted_params) { proximity_interpreted_params.merge(stolenness: "stolen") }
      let(:non_stolen_interpreted_params) { proximity_interpreted_params.merge(stolenness: "non") }
      let!(:non_stolen) { FactoryGirl.create(:bike, manufacturer: manufacturer, primary_frame_color: color, serial_number: "s") }
      let!(:stolen) { FactoryGirl.create(:stolen_bike, manufacturer: manufacturer, primary_frame_color: color, serial_number: "5") }
      let!(:stolen_proximity) { FactoryGirl.create(:stolen_bike, manufacturer: manufacturer, secondary_frame_color: color, serial_number: "S", latitude: 41.8624488, longitude: -87.6591502) }
      before { Geocoder.configure(lookup: :google, use_https: true) } # Configuration matches geocode initializer
      after { Geocoder.configure(lookup: :test) } # reset to test
      it "calls Bike Search with the expected interpreted_params" 

    end
    context 'nil params' do
      it 'succeeds' 

    end
    context 'with query items' do
      let!(:bike) { FactoryGirl.create(:bike, manufacturer: manufacturer) }
      let!(:bike_2) { FactoryGirl.create(:bike) }
      let(:query_params) { { query_items: [manufacturer.search_id] } }
      it 'succeeds' 

    end
  end
end

