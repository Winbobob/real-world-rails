require 'rails_helper'

RSpec.describe ExternalUsers::ClaimTypesController, type: :controller, focus: true do

  let(:external_user) { create(:external_user, :agfs_lgfs_admin) }

  before do
    sign_in(external_user.user)
  end

  describe 'GET #selection' do
    context 'when provider has no available claim types' do
      let(:context_mapper) { instance_double(Claims::ContextMapper) }

      before do
        allow(Claims::ContextMapper).to receive(:new).and_return(context_mapper)
        allow(context_mapper).to receive(:available_comprehensive_claim_types).and_return([])
      end

      it 'redirects the user to the claims page with an error' 

    end

    context 'when the only claim type available cannot be managed by the user' do
      let(:context_mapper) { instance_double(Claims::ContextMapper) }
      let(:claim_class) { Claim::BaseClaim }

      before do
        allow(Claims::ContextMapper).to receive(:new).and_return(context_mapper)
        allow(context_mapper).to receive(:available_comprehensive_claim_types).and_return(%w[invalid_bill_type])
      end

      it 'redirects the user to the claims page with an error' 

    end

    context 'admin of AGFS and LGFS provider' do
      let(:external_user) { create(:external_user, :agfs_lgfs_admin) }

      context 'when AGFS fee reform feature flag is NOT active' do
        before do
          allow(FeatureFlag).to receive(:active?).with(:agfs_fee_reform).and_return(false)
        end

        it "assigns bill types based on provider roles" 


        it "renders claim type options page" 

      end

      context 'when AGFS fee reform feature flag is active' do
        before do
          allow(FeatureFlag).to receive(:active?).with(:agfs_fee_reform).and_return(true)
        end

        it "assigns bill types based on provider roles" 


        it "renders the bill type options page" 

      end
    end

    context 'admin of AGFS provider' do
      let(:external_user) { create(:external_user, :admin, provider: create(:provider, :agfs)) }

      context 'when AGFS fee reform feature flag is NOT active' do
        before do
          allow(FeatureFlag).to receive(:active?).with(:agfs_fee_reform).and_return(false)
        end

        it "assigns bill types based on provider roles" 


        it "redirects to the new advocate claim form page" 

      end

      context 'when AGFS fee reform feature flag is active' do
        before do
          allow(FeatureFlag).to receive(:active?).with(:agfs_fee_reform).and_return(true)
        end

        it "assigns bill types based on provider roles" 


        it "renders the bill type options page" 

      end
    end

    context 'admin of LGFS provider' do
      let(:external_user) { create(:external_user, :admin, provider: create(:provider, :lgfs)) }

      it "assigns bill types based on provider roles" 


      it "renders bill type selection page" 

    end

    context 'litigator' do
      let(:external_user) { create(:external_user, :litigator) }

      it "assigns bill types based on external_user roles" 


      it 'renders the bill type selection page' 

    end
  end

  describe 'POST #chosen' do
    context 'when an invalid scheme is provided' do
      before { post :chosen, params: { claim_type: 'invalid' }}

      it "redirects the user to the claims page with an error" 

    end

    context "AGFS claim" do
      before { post :chosen, params: { claim_type: 'agfs' }}

      it "should redirect to the new advocate claim form page" 

    end

    context "LGFS final claim" do
      before { post :chosen, params: { claim_type: 'lgfs_final' }}

      it "should redirect to the new litigator final claim form page" 

    end

    context "LGFS interim claim" do
      before { post :chosen, params: { claim_type: 'lgfs_interim' }}

      it "should redirect to the new litigator interim claim form page" 

    end

    context "LGFS transfer claim" do
      before { post :chosen, params: { claim_type: 'lgfs_transfer' }}

      it "should redirect to the new litigator transfer claim form page" 

    end
  end
end

