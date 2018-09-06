require "spec_helper"

RSpec.describe HandlePaypalIpnMessageJob, type: :job do
  let(:community) { FactoryGirl.create(:community) }
  let(:transaction_process) { FactoryGirl.create(:transaction_process) }
  let(:listing) {
    FactoryGirl.create(:listing, community_id: community.id,
                                 listing_shape_id: 123,
                                 transaction_process_id: transaction_process.id)
  }
  let(:transaction) { FactoryGirl.create(:transaction, community: community, listing: listing, current_state: 'initiated') }
  let(:transaction2) { FactoryGirl.create(:transaction, community: community, listing: listing, current_state: 'initiated') }

  context '#perform' do
    it 'IPN message - commission denied' 


    it 'IPN message - adjustment' 


    it 'IPN message - commission pending' 


    it 'IPN message - fixed find paypal payment' 

  end
end

