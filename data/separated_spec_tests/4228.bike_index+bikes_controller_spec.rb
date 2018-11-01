require 'spec_helper'

describe Api::V1::BikesController do
  describe 'index' do
    it 'loads the page and have the correct headers' 

  end

  describe 'stolen_ids' do
    it 'returns correct code if no org' 


    it 'should return an array of ids' 

  end

  describe 'show' do
    it 'loads the page' 

  end

  describe 'create' do
    before do
      FactoryGirl.create(:wheel_size, iso_bsd: 559)
      FactoryGirl.create(:ctype, name: 'wheel')
      FactoryGirl.create(:ctype, name: 'headset')
    end
    context 'pos_integrator rear_gear_type_slug error' do
      let(:auto_user) { FactoryGirl.create(:organization_auto_user) }
      let(:organization) { auto_user.organizations.first }
      let(:manufacturer) { FactoryGirl.create(:manufacturer, name: 'Specialized') }
      let(:black) { FactoryGirl.create(:color, name: 'Black') }
      let(:red) { FactoryGirl.create(:color, name: 'Red') }
      let(:bike_hash) do
        {
          organization_slug: organization.slug,
          access_token: organization.access_token,
          bike: {
            owner_email: 'example@gmail.com',
            serial_number: 'SSOMESERIAL',
            manufacturer: 'Specialized',
            frame_model: 'Diverge Elite DSW (58)',
            color: 'Black/Red',
            send_email: true,
            frame_size: '58',
            frame_size_unit: 'cm',
            year: 2016,
            rear_wheel_size: nil,
            rear_gear_type_slug: nil,
            handlebar_type_slug: nil,
            frame_material_slug: nil,
            description: 'Diverge Elite DSW (58)',
            is_pos: true,
            is_new: true,
            is_bulk: true
          }
        }
      end
      before do
        expect([black, red, manufacturer].size).to eq 3
      end
      it 'creates a bike and does not duplicate' 

    end
    context 'legacy tests' do
      before :each do
        @organization = FactoryGirl.create(:organization)
        user = FactoryGirl.create(:user)
        FactoryGirl.create(:membership, user: user, organization: @organization)
        @organization.save
      end

      it 'returns correct code if not logged in' 


      it 'returns correct code if bike has errors' 


      it "emails us if it can't create a record" 


      it 'creates a record and reset example' 


      it 'creates a photos even if one fails' 


      it "creates a stolen record" 


      it 'creates an example bike if the bike is from example, and include all the options' 


      it 'creates a record even if the post is a string' 


      it 'does not send an ownership email if it has no_email set' 

    end
  end
end

