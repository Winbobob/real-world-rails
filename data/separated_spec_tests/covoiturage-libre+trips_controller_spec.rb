require 'rails_helper'

describe TripsController, type: :controller do
  describe "POST #create" do

    before(:each) do
      @trip = FactoryBot.attributes_for(:trip)

      # Array of points in params
      @trip_points_params = Hash[@trip[:points].map { |point|
        [
          "points_attributes[#{SecureRandom.random_number(10_000_000)}]",
          point.attributes.slice(
            'kind',
            'rank', 'price',
            'lat', 'lon',
          ).merge('city' => City.last.name)
        ]
      }]
    end

    it "should save new Trip with good time" 


    it "should render error when wrong time filled" 


  end
end

