# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe Api::InventoryUnitsController, type: :request do
    let!(:inventory_unit) { create(:inventory_unit) }

    before do
      stub_authentication!
    end

    context "as an admin" do
      sign_in_as_admin!
      let(:variant) { create(:variant) }

      it "gets an inventory unit" 


      it "updates an inventory unit" 


      context 'fires state event' do
        it 'if supplied with :fire param' 


        it 'and returns exception if cannot fire' 


        it 'and returns exception bad state' 

      end
    end
  end
end

