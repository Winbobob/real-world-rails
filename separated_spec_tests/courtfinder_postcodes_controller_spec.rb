require 'spec_helper'

describe Admin::PostcodesController do
  let(:user) { create(:user, admin: true) }
  let(:court) { create(:court) }
  let(:postcode_court) { create(:postcode_court, court: court) }
  let(:postcode_court2) { build(:postcode_court, court: court, postcode: 'N1234') }

  before :each do
    sign_in user
  end

  describe 'PUT' do
    let(:court2) { create :court }

    context 'update' do
      it "moving to postcode_court" 


      it "postcodes to move not present" 


      it "warning if postcodes to move not present" 


      it "no valid postcodes moved" 


      it "1 valid postcode moved and 1 invalid not moved" 

    end
  end
end

