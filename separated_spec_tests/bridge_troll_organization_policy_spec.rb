require 'rails_helper'

describe OrganizationPolicy do
  describe '#manage_organization?' do
    let(:user) { create(:user) }
    let(:organization) { create(:organization) }

    it 'is false for logged-out users' 


    it 'is false for users that do not manage the organization' 


    context 'for users that do manage the organization' do
      before do
        organization.leaders << user
      end

      it 'is true' 

    end
  end

  describe "create?" do
    describe 'for regular users' do
      let(:user) { create(:user) }

      it 'is false' 

    end

    describe 'for admins' do
      let(:admin) { create(:user, admin: true) }

      it 'is true' 

    end
  end
end

