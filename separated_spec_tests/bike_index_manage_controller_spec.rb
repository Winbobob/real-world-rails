require 'spec_helper'

describe Organized::ManageController, type: :controller do
  context 'logged_in_as_organization_member' do
    include_context :logged_in_as_organization_member
    describe 'index' do
      it 'redirects' 

    end

    describe 'dev' do
      it 'redirects' 

    end

    describe 'locations' do
      it 'redirects' 

    end

    describe 'standard organization' do
      it 'does not destroy' 

    end
  end
  context 'logged_in_as_organization_admin' do
    include_context :logged_in_as_organization_admin
    describe 'index' do
      it 'renders' 

    end

    describe 'landing' do
      it 'renders' 

    end

    describe 'dev' do
      it 'renders' 

    end

    describe 'locations' do
      it 'renders' 

    end

    describe 'update' do
      context 'dissallowed attributes' do
        let(:org_attributes) do
          {
            available_invitation_count: 10,
            sent_invitation_count: 1,
            is_suspended: false,
            embedable_user_email: user.email,
            auto_user_id: user.id,
            show_on_map: false,
            api_access_approved: false,
            access_token: 'stuff7',
            new_bike_notification: 'stuff8',
            lock_show_on_map: true,
            is_paid: false
          }
        end
        let(:user_2) { FactoryGirl.create(:organization_member, organization: organization) }
        let(:update_attributes) do
          {
            # slug: 'short_name',
            slug: 'cool name and stuffffff',
            available_invitation_count: '20',
            sent_invitation_count: '0',
            is_suspended: true,
            auto_user_id: user.id,
            embedable_user_email: user_2.email,
            api_access_approved: true,
            access_token: 'things7',
            new_bike_notification: 'things8',
            website: ' www.drseuss.org',
            name: 'some new name',
            org_type: 'shop',
            is_paid: true,
            lock_show_on_map: false,
            show_on_map: true,
            locations_attributes: []
          }
        end
        # Website is also permitted, but we're manually setting it
        let(:permitted_update_keys) { [:org_type, :auto_user_id, :embedable_user_email, :name, :website] }
        before do
          expect(user_2).to be_present
          organization.update_attributes(org_attributes)
        end
        it 'updates, sends message about maps' 

      end
      context 'with locations and normal show_on_map' do
        let(:state) { FactoryGirl.create(:state) }
        let(:country) { state.country }
        let(:location_1) { FactoryGirl.create(:location, organization: organization, street: 'old street', name: 'cool name') }
        let(:update_attributes) do
          {
            name: organization.name,
            show_on_map: true,
            org_type: 'shop',
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
        before do
          expect(update_attributes).to be_present
          expect(organization.show_on_map).to be_falsey
          expect(organization.lock_show_on_map).to be_falsey
        end
        context 'update' do
          it 'updates and adds the locations and shows on map' 

        end
        context 'remove' do
          it 'removes the location' 

        end
      end
    end

    describe 'destroy' do
      context 'standard organization' do
        it 'destroys' 

      end
      context 'paid organization' do
        it 'does not destroy' 

      end
    end
  end
end

