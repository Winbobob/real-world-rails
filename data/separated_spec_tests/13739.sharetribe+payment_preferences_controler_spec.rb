require 'spec_helper'

describe Admin::PaymentPreferencesController, type: :controller do
  let(:community) do
    community = FactoryGirl.create(:community)
    payment_provision(community, 'paypal')
    payment_enable(community, 'paypal', commission_from_seller: 11, minimum_price_cents: 111)
    payment_provision(community, 'stripe')
    payment_enable(community, 'stripe', commission_from_seller: 22, minimum_price_cents: 111)
    PaymentSettings.where(payment_gateway: 'paypal').first
      .update_column(:minimum_transaction_fee_cents, 100)
    PaymentSettings.where(payment_gateway: 'stripe').first
      .update_column(:minimum_transaction_fee_cents, 100)
    community
  end
  let(:person) do
    person = FactoryGirl.create(:person, community: community, is_admin: true)
    FactoryGirl.create(:community_membership, community: community, person: person, admin: true)
    person
  end

  before do
    @request.host = "#{community.ident}.lvh.me"
    @request.env[:current_marketplace] = community
    sign_in_for_spec(person)
  end

  context '#common_update' do
    it 'update general preferences' 


    it 'update paypal preferences' 


    it 'update stripe preferences' 

  end
end

