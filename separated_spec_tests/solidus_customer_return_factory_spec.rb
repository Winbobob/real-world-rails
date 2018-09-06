# frozen_string_literal: true

require 'rails_helper'
require 'spree/testing_support/factories/customer_return_factory'

RSpec.describe 'customer return factory' do
  let(:factory_class) { Spree::CustomerReturn }

  describe 'customer return' do
    let(:factory) { :customer_return }

    it_behaves_like 'a working factory'

    # Regression test for https://github.com/solidusio/solidus/pull/697
    it "creates only one of dependent records" 

  end

  describe 'customer return with accepted items' do
    let(:factory) { :customer_return_with_accepted_items }

    it_behaves_like 'a working factory'
  end

  describe 'customer return without return items' do
    let(:factory) { :customer_return_without_return_items }

    it "builds successfully" 


    # No create test, because this factory is (intentionally) invalid
  end
end

