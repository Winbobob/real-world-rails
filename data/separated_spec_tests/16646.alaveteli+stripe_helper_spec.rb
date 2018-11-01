require 'spec_helper'

describe StripeHelper do
  include StripeHelper

  let(:current_user) { FactoryBot.create(:user) }

  before(:each) do
    allow(AlaveteliConfiguration).to receive(:stripe_publishable_key).
      and_return('ABC123')
    allow(AlaveteliConfiguration).to receive(:pro_site_name).
      and_return('Pro Site')
  end

  describe '#stripe_button' do

    it 'outputs javascript tag with remote Stripe.com source' 


    it 'includes default data attibutes' 


    it 'can override default data attibutes' 


    it 'can add other data attibutes' 


  end

end

