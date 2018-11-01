require 'rails_helper'

RSpec.describe ExternalUsers::Admin::ProvidersController, type: :controller do
  let(:admin)     { create(:external_user, :admin, provider: provider) }
  let(:provider)  { create(:provider, :lgfs, name: 'test 123') }

  subject { provider }

  before { sign_in admin.user }

  describe "GET #show" do
    before { get :show, params: { id: subject } }

    it "returns http success" 


    it 'assigns @provider' 

  end

  describe "GET #edit" do
    before { get :edit, params: { id: subject } }

    it "returns http success" 


    it 'assigns @provider' 

  end

  describe "PUT #update" do
    it 'does not allow updating of provider type' 


    context 'when valid' do
      before(:each) { put :update, params: { id: subject, provider: {name: 'test firm'} } }

      it 'updates successfully' 


      it 'redirects to providers show page' 

    end

    context 'when invalid' do
      before(:each) { put :update, params: { id: subject, provider: {name: ''} } }

      it 'does not update provider' 


      it 'renders the edit template' 

    end

    describe 'multiple supplier numbers' do
      let(:provider) { create(:provider, :lgfs) }
      subject { provider }

      before(:each) { subject.lgfs_supplier_numbers.delete_all }

      context 'when invalid' do
        before(:each) do
          put :update, params: { id: subject, provider: {
              lgfs_supplier_numbers_attributes: [
                  {supplier_number: 'XY123'},
                  {supplier_number: ''}
              ]
          } }
        end

        it 'does not update provider' 


        it 'renders the edit template' 

      end

      context 'when valid' do
        before(:each) do
          put :update, params: { id: subject, provider: {
              lgfs_supplier_numbers_attributes: [
                  {supplier_number: '1B222Z'},
                  {supplier_number: '2B555Z'}
              ]
          } }
        end

        it 'updates the provider' 


        it 'redirects to providers show page' 

      end
    end
  end
end

