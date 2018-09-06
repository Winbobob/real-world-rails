require 'spec_helper'

module Spree
  describe Api::V1::ZonesController, type: :controller do
    render_views

    let!(:attributes) { [:id, :name, :zone_members] }

    before do
      stub_authentication!
      @zone = create(:zone, name: 'Europe')
    end

    it 'gets list of zones' 


    it 'can control the page size through a parameter' 


    it 'can query the results through a paramter' 


    it 'gets a zone' 


    context 'as an admin' do
      sign_in_as_admin!

      let!(:country) { create(:country) }

      it 'can create a new zone' 


      it 'updates a zone' 


      it 'can delete a zone' 

    end
  end
end

