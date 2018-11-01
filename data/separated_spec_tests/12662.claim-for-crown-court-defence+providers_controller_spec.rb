require 'rails_helper'

RSpec.describe SuperAdmins::ProvidersController, type: :controller do
  let(:super_admin) { create(:super_admin) }
  let(:providers)   { create_list(:provider, 5) }
  let(:provider)    { create(:provider, :lgfs, name: 'test 123') }

  subject { provider }

  before { sign_in super_admin.user }

  describe "GET #show" do
    before { get :show, params: { id: subject } }

    it "returns http success" 


    it 'assigns @provider' 

  end

  describe "GET #index" do
    before { get :index }

    it "returns http success" 


    it 'assigns @providers to ALL providers' 

  end

  describe "GET #edit" do
    before { get :edit, params: { id: subject } }

    it "returns http success" 


    it 'assigns @provider' 

  end

  describe "PUT #update" do

    context 'when changing from firm to chamber' do

      it 'changes from chamber to firm and removes LGFS supplier numbers' 


    end

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
              supplier_numbers_attributes: [
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

  describe "GET #new" do
    before { get :new }

    it 'returns http succes' 


    it "assigns a new provider to @provider" 

  end

  describe "POST #create" do
    before(:each) do
      post :create, params: { provider: params }
    end

    context 'when valid' do
      let(:params) do
        {
          provider_type: 'firm',
          name: 'St Johns',
          firm_agfs_supplier_number: '2M462',
          roles: ['lgfs', 'agfs'],
          vat_registered: false,
          lgfs_supplier_numbers_attributes: {
            '0'=>{'supplier_number' => '2E481W', '_destroy' => 'false'}
          }
        }
      end

      it "creates a new provider" 


      it 'redirects to index' 

    end

    context 'when invalid' do
      let(:params) do
        {name: 'St Johns', supplier_number: '4321'}
      end

      it "does not create a provider" 


      it 'renders new action' 

    end
  end
end

