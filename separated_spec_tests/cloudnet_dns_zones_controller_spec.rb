require 'rails_helper'

describe DnsZonesController do
  describe 'as a signed in user' do
    before(:each) { sign_in_onapp_user }

    describe 'going to the index page' do
      it 'should be on the dns zones index page' 


      it 'should assign @domains to display for the current user' 

    end

    describe 'going to the DNS zone create page' do
      it 'should be on the new page' 


      it 'should create a new DNS zone model' 

    end

    describe 'going to the DNS zone show page' do
      let(:domain) { FactoryGirl.create(:dns_zone, user: @current_user) }

      before :each do
        records = { 'records' => {} }
        allow_any_instance_of(LoadDnsZoneRecords).to receive(:process).and_return(records)
      end

      it 'should render the show template' 


      it 'should show records for the domain' 

    end
  end
end

