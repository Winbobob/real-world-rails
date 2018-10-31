require 'spec_helper'

describe Bikes::RecoveryController, type: :controller do
  let(:bike) { FactoryGirl.create(:stolen_bike) }
  let(:stolen_record) { bike.current_stolen_record }
  let(:recovery_link_token) { stolen_record.find_or_create_recovery_link_token }

  describe 'edit' do
    context 'nonmatching recovery token' do
      it 'renders' 

    end
    context 'matching recovery token' do
      it 'renders' 

    end
    context 'already recovered bike' do
      before { stolen_record.add_recovery_information }
      it 'redirects' 

    end
  end

  describe 'update' do
    let(:recovery_info) do
      {
        date_recovered: "2018-07-28T18:57:13.277",
        timezone: "America/Monterrey",
        recovered_description: 'Some sweet description',
        index_helped_recovery: '0',
        can_share_recovery: '1'
      }
    end
    context 'matching recovery token' do
      it 'updates' 

    end
    context 'non-matching recovery token' do
      it 'does not update' 

    end
  end
end

