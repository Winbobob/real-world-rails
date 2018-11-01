require 'spec_helper'

describe AlaveteliPro::StripeNamespace do
  include AlaveteliPro::StripeNamespace

  context 'with namespace' do

    before(:each) do
      allow(AlaveteliConfiguration).to receive(:stripe_namespace).
        and_return('namespace')
    end

    describe '#add_stripe_namespace' do
      it 'prepend namespace to string' 

    end

    describe '#remove_stripe_namespace' do
      it 'removes namespace from string' 

    end

  end

  context 'without namespace' do

    before(:each) do
      allow(AlaveteliConfiguration).to receive(:stripe_namespace).
        and_return('')
    end

    describe '#add_stripe_namespace' do
      it 'return string' 

    end

    describe '#remove_stripe_namespace' do
      it 'return string' 

    end

  end

end

