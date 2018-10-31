require 'spec_helper'

describe Organized::BikesController, type: :controller do
  let(:non_organization_bike) { FactoryGirl.create(:bike) }
  before do
    expect(non_organization_bike).to be_present
  end
  context 'logged_in_as_organization_admin' do
    include_context :logged_in_as_organization_admin
    describe 'index' do
      it 'renders' 

    end

    describe 'new' do
      it 'renders' 

    end
  end

  context 'logged_in_as_organization_member' do
    include_context :logged_in_as_organization_member
    context 'paid organization' do
      before do
        organization.update_attributes(is_paid: true, has_bike_search: true, show_partial_registrations: true)
        expect(organization.bike_search?).to be_truthy
      end
      describe 'index' do
        context 'with params' do
          let(:query_params) do
            {
              query: '1',
              manufacturer: '2',
              colors: %w(3 4),
              location: '5',
              distance: '6',
              serial: '9',
              query_items: %w(7 8),
              stolenness: 'stolen'
            }.as_json
          end
          let(:organization_bikes) { organization.bikes }
          it 'sends all the params and renders search template to organization_bikes' 

        end
        context 'without params' do
          it 'renders, assigns search_query_present and stolenness all' 

        end
      end
      describe 'recoveries' do
        let(:bike) { FactoryGirl.create(:stolen_bike) }
        let(:bike2) { FactoryGirl.create(:stolen_bike) }
        let(:recovered_record) { bike.find_current_stolen_record }
        let(:recovered_record2) { bike2.find_current_stolen_record }
        let!(:bike_organization) { FactoryGirl.create(:bike_organization, bike: bike, organization: organization) }
        let!(:bike_organization2) { FactoryGirl.create(:bike_organization, bike: bike2, organization: organization) }
        let(:date) { "2016-01-10 13:59:59" }
        let(:recovery_information) do
          {
            recovered_description: 'recovered it on a special corner',
            index_helped_recovery: true,
            can_share_recovery: true,
            date_recovered: "2016-01-10 13:59:59"
          }
        end
        before do
          recovered_record.add_recovery_information
          recovered_record2.add_recovery_information(recovery_information)
        end
        it 'renders, assigns search_query_present and stolenness all' 

      end
      describe "incompletes" do
        let(:partial_reg_attrs) do
          {
            bike: {
              manufacturer_id: Manufacturer.other.id,
              primary_frame_color_id: Color.black.id,
              owner_email: "something@stuff.com",
              creation_organization_id: organization.id
            }
          }
        end
        let!(:partial_registration) { BParam.create(params: partial_reg_attrs, origin: "embed_partial") }
        it "renders" 

      end
    end
    context 'unpaid organization' do
      before do
        expect(organization.is_paid).to be_falsey
      end
      describe "index" do
        it "renders without search" 

      end
      describe "recoveries" do
        it "redirects recoveries" 

      end
      describe "incompletes" do
        it "redirects incompletes" 

      end
    end

    describe 'new' do
      it 'renders' 

    end
  end
end

