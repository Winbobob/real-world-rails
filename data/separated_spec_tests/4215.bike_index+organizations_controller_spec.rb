require 'spec_helper'

describe Admin::OrganizationsController, type: :controller do
  let(:organization) { FactoryGirl.create(:organization, approved: false) }
  include_context :logged_in_as_super_admin

  describe 'index' do
    it 'renders' 

  end

  describe 'edit' do
    it 'renders' 

  end

  describe 'organization update' do
    let(:state) { FactoryGirl.create(:state) }
    let(:country) { state.country }
    let(:parent_organization) { FactoryGirl.create(:organization) }
    let(:location_1) { FactoryGirl.create(:location, organization: organization, street: 'old street', name: 'cool name') }
    let(:update_attributes) do
      {
        name: 'new name thing stuff',
        show_on_map: true,
        org_type: 'shop',
        is_paid: 'true',
        parent_organization_id: parent_organization.id,
        locations_attributes: {
          '0' => {
            id: location_1.id,
            name: 'First shop',
            zipcode: '2222222',
            city: 'First city',
            state_id: state.id,
            country_id: country.id,
            street: 'some street 2',
            phone: '7272772727272',
            email: 'stuff@goooo.com',
            latitude: 22_222,
            longitude: 11_111,
            organization_id: 844,
            shown: false,
            _destroy: 0
          },
          Time.zone.now.to_i.to_s => {
            created_at: Time.zone.now.to_f.to_s,
            name: 'Second shop',
            zipcode: '12243444',
            city: 'cool city',
            state_id: state.id,
            country_id: country.id,
            street: 'some street 2',
            phone: '7272772727272',
            email: 'stuff@goooo.com',
            latitude: 22_222,
            longitude: 11_111,
            organization_id: 844,
            shown: false
          }
        }
      }
    end
    it 'updates the organization' 

  end
end

