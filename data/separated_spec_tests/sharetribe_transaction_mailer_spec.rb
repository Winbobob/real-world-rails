require 'spec_helper'

describe TransactionMailer, type: :mailer do

  describe 'Payment receipt' do
    let(:community) { FactoryGirl.create(:community) }
    let(:seller) {
      FactoryGirl.create(:person, member_of: community,
                                  given_name: "Joan", family_name: "Smith")
    }
    let(:buyer) { FactoryGirl.create(:person, member_of: community) }
    let(:listing) { FactoryGirl.create(:listing, community_id: community.id, author: seller) }
    let(:paypal_transaction) do
      transaction = FactoryGirl.create(:transaction, starter: buyer,
                                                     community: community, listing: listing,
                                                     current_state: 'paid', payment_gateway: 'paypal')
      FactoryGirl.create(:paypal_payment, community_id: community.id, transaction_id: transaction.id,
                                          payment_total_cents: 500, fee_total_cents: 150, payment_status: "completed",
                                          commission_total_cents: 0, commission_fee_total_cents: 0)
      service_name(transaction.community_id)
      transaction
    end
    let(:stripe_transaction) do
      transaction = FactoryGirl.create(:transaction, starter: buyer,
                                                     community: community, listing: listing,
                                                     current_state: 'paid', payment_gateway: 'stripe')
      FactoryGirl.create(:stripe_payment, community_id: community.id, tx: transaction)
      service_name(transaction.community_id)
      transaction
    end

    describe '#payment_receipt_to_seller' do
      it 'works with default payment gateway' 


      it 'works with stripe payment gateway' 

    end

    describe '#payment_receipt_to_buyer' do
      it 'works with default payment gateway' 


      it 'works with stripe payment gateway' 

    end

    def service_name(community_id)
      ApplicationHelper.store_community_service_name_to_thread_from_community_id(community_id)
    end
  end
end

