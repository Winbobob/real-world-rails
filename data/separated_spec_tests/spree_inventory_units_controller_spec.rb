require 'spec_helper'

module Spree
  describe Api::V1::InventoryUnitsController, type: :controller do
    render_views

    before do
      stub_authentication!
      @inventory_unit = create(:inventory_unit)
    end

    context 'as an admin' do
      sign_in_as_admin!

      it 'gets an inventory unit' 


      it 'updates an inventory unit' 


      context 'fires state event' do
        it 'if supplied with :fire param' 


        it 'and returns exception if cannot fire' 


        it 'and returns exception bad state' 

      end
    end
  end
end

