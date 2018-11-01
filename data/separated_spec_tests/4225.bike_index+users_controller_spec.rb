require 'spec_helper'

describe Api::V1::UsersController do
  describe 'current' do
    it 'returns user_present = false if there is no user present' 


    it 'returns user_present if a user is present' 

  end

  describe 'send_request' do
    it 'actuallies send the mail' 

    context 'manufacturer_update_manufacturer present' do
      it 'updates the manufacturer' 

    end

    context 'manufacturer_update_manufacturer present' do
      it 'does not make nil manufacturer' 

    end

    context 'serial request mail' do
      it "doesn't create a new serial request mail" 

    end

    it 'it untsvs a bike' 


    describe 'recovery' do
      let(:bike) { FactoryGirl.create(:stolen_bike) }
      let(:stolen_record) { bike.current_stolen_record }
      let(:ownership) { FactoryGirl.create(:ownership, bike: bike) }
      let(:user) { ownership.creator }
      let(:recovery_request) do
        {
          request_type: 'bike_recovery',
          user_id: user.id,
          request_bike_id: bike.id,
          request_reason: 'Some reason',
          index_helped_recovery: 'true',
          can_share_recovery: 'true',
          mark_recovered_stolen_record_id: stolen_record.id
        }
      end

      before do
        expect(bike.find_current_stolen_record.id).to eq stolen_record.id
        set_current_user(user)
      end

      it 'recovers the bike' 

    end

    it "does not create a new serial request mailer if a user isn't present" 


    it 'does not create a new serial request mailer if wrong user user is present' 

  end
end

