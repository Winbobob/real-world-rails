require 'spec_helper'

module Spree
  describe FrontendHelper, type: :helper do
    # Regression test for #2034
    context 'flash_message' do
      let(:flash) { { 'notice' => 'ok', 'foo' => 'foo', 'bar' => 'bar' } }

      it 'outputs all flash content' 


      it 'outputs flash content except one key' 


      it 'outputs flash content except some keys' 

    end

    # Regression test for #2759
    it 'nested_taxons_path works with a Taxon object' 


    context '#checkout_progress' do
      before do
        @order = create(:order, state: 'address')
      end

      it 'does not include numbers by default' 


      it 'has option to include numbers' 

    end
  end
end

