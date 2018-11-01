require 'rails_helper'

describe IpLocationWorker do
  let(:subject) { described_class.new }

  describe '#perform' do
    let!(:user) { create(:user) }

    before do
      allow(Pointpin).to receive(:locate) {
        {
          "country_name" => "country",
          "region_name" => "region",
          "city_name" => "city",
          "postcode" => "110011",
        }
      }
    end

    it 'should create the ip location unless the location is in the given blacklist' 


    it 'should not create the ip location if it is in the given blacklist' 

  end
end

