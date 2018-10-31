# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe Api::AddressBooksController, type: :request do
    let!(:state) { create(:state) }
    let!(:harry_address_attributes) do
      {
        'firstname' => 'Harry',
        'lastname' => 'Potter',
        'address1' => '4 Privet Drive',
        'address2' => 'cupboard under the stairs',
        'city' => 'Surrey',
        'zipcode' => '10010',
        'phone' => '555-5555',
        'state_id' => state.id,
        'country_id' => state.country.id
      }
    end

    let!(:ron_address_attributes) do
      {
        'firstname' => 'Ron',
        'lastname' => 'Weasly',
        'address1' => 'Ottery St. Catchpole',
        'address2' => '4th floor',
        'city' => 'Devon, West Country',
        'zipcode' => '10010',
        'phone' => '555-5555',
        'state_id' => state.id,
        'country_id' => state.country.id
      }
    end

    context 'as address book owner' do
      context 'with ability' do
        it 'returns my address book' 


        it 'updates my address book' 


        context 'when creating an address' do
          it 'marks the update_target' 

        end

        context 'when updating an address' do
          it 'marks the update_target' 

        end

        it 'archives my address' 

      end
    end

    context 'on behalf of address book owner' do
      context 'with ability' do
        before do
          Spree::Config.roles.assign_permissions 'Prefect', [Spree::PermissionSets::UserManagement]
          create(:user, spree_api_key: 'galleon', spree_roles: [build(:role, name: 'Prefect')])
        end

        it "returns another user's address book" 


        it "updates another user's address" 


        it "archives another user's address" 

      end

      context 'without ability' do
        it 'does not return another user address book' 


        it 'does not update another user address' 


        it 'does not archive another user address' 

      end
    end

    context 'unauthenticated' do
      before do
        @user = create(:user)
      end

      it 'GET returns a 401' 


      it 'UPDATE returns a 401' 


      it 'DELETE returns a 401' 

    end
  end
end

