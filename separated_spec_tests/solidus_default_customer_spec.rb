# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Spree::PermissionSets::DefaultCustomer do
  context 'as Guest User' do
    context 'for Order' do
      context 'guest_token is empty string' do
        let(:ability) { Spree::Ability.new(nil) }
        let(:resource) { build(:order) }
        let(:token) { '' }

        it 'should not be allowed to read or update the order' 

      end
    end
  end
end

