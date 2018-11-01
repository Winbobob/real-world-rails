require 'spec_helper'

describe OrganizationsController do
  describe 'new' do
    context 'with out user' do
      it 'renders' 

    end
    context 'with user' do
      it 'renders with revised_layout' 

    end
  end

  describe 'create' do
    it 'creates org, membership, filters approved attrs & redirect to org with current_user' 


    it 'creates org, membership, filters approved attrs & redirect to org with current_user' 


    it "Doesn't xss" 


    it 'mails us' 

  end

  describe 'legacy embeds' do
    let(:organization) { FactoryGirl.create(:organization_with_auto_user) }
    before do
      FactoryGirl.create(:cycle_type, slug: 'bike')
      FactoryGirl.create(:propulsion_type, name: 'Foot pedal')
    end
    context 'non-stolen' do
      it 'renders embed without xframe block' 

    end
    context 'stolen' do
      it 'renders embed without xframe block' 

    end
    context 'embed_extended' do
      it 'renders embed without xframe block, not stolen' 

    end
    context 'crazy b_param data' do
      let(:b_param_attrs) do
        {
          bike: {
            stolen: 'true',
            owner_email: 'someemail@stuff.com',
            creation_organization_id: organization.id.to_s
          },
          stolen_record: {
            phone_no_show: 'true',
            phone: '7183839292'
          }
        }
      end
      let(:b_param) { FactoryGirl.create(:b_param, params: b_param_attrs) }
      it 'renders' 

    end
  end

  describe 'connect_lightspeed' do
    context 'with user with organization' do
      include_context :logged_in_as_organization_admin
      it 'redirects to posintegration' 

    end
    context 'with user without organization' do
      include_context :logged_in_as_user
      it 'redirects to posintegration' 

    end
    context 'without user' do
      it 'redirects to posintegration' 

    end
  end
end

