require 'spec_helper'

module Spree
  describe Api::V1::StoresController, type: :controller do
    render_views

    let!(:store) do
      create(:store, name: 'My Spree Store', url: 'spreestore.example.com')
    end

    before do
      stub_authentication!
    end

    context 'as an admin' do
      sign_in_as_admin!

      let!(:non_default_store) do
        create(:store,
               name: 'Extra Store',
               url: 'spreestore-5.example.com',
               default: false)
      end

      it 'I can list the available stores' 


      it 'I can get the store details' 


      it 'I can create a new store' 


      it 'I can update an existing store' 


      context 'deleting a store' do
        it "will fail if it's the default Store" 


        it 'will destroy the store' 

      end
    end

    context 'as an user' do
      it 'I cannot list all the stores' 


      it 'I cannot get the store details' 


      it 'I cannot create a new store' 


      it 'I cannot update an existing store' 

    end
  end
end

