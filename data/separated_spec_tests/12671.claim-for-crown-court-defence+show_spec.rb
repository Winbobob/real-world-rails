require 'rails_helper'

RSpec.describe 'external_users/claims/show.html.haml', type: :view do
  include ViewSpecHelper
  let!(:lgfs_scheme_nine) { FeeScheme.find_by(name: 'LGFS', version: 9) || create(:fee_scheme, :lgfs_nine) }
  let!(:agfs_scheme_nine) { FeeScheme.find_by(name: 'AGFS', version: 9) || create(:fee_scheme, :agfs_nine) }
  let!(:agfs_scheme_ten) { FeeScheme.find_by(name: 'AGFS', version: 10) || create(:fee_scheme) }

  before(:all) do
    @external_user = create(:external_user, :litigator_and_admin)
  end

  after(:all) do
    clean_database
  end

  before(:each) do
    initialize_view_helpers(view)
    sign_in(@external_user.user, scope: :user)
    allow(view).to receive(:current_user_persona_is?).and_return(false)
  end

  context 'for AGFS claims' do
    describe 'document checklist' do
      let(:claim) { create(:claim, evidence_checklist_ids: [1, 9]) }

      before do
        assign(:claim, claim)
        assign(:messages, claim.messages.most_recent_last)
        assign(:message, claim.messages.build)
      end

      it 'displays the documents that have been uploaded' 


      it 'does not display a `download all` link' 

    end

    describe 'basic claim information' do
      let(:claim) { create(:claim, evidence_checklist_ids: [1, 9]) }

      before do
        assign(:claim, claim)
        assign(:messages, claim.messages.most_recent_last)
        assign(:message, claim.messages.build)
      end

      it 'displays the advocate category section' 


      it 'displays the advocate account number section' 

    end

    describe 'offence details information' do
      context 'when the claim is for a fixed fee case type' do
        let(:claim) { create(:advocate_claim, :with_fixed_fee_case) }

        it 'does NOT displays offence details section' 

      end

      context 'when the claim is NOT for a fixed fee case type' do
        let(:claim) { create(:advocate_claim, :with_graduated_fee_case) }

        it 'displays offence details section' 

      end
    end
  end

  context 'for LGFS claims' do
    let(:claim) { create(:litigator_claim) }

    before do
      assign(:claim, claim)
      assign(:messages, claim.messages.most_recent_last)
      assign(:message, claim.messages.build)
    end

    describe 'basic claim information' do
      it 'doesn\'t display the litigator category section' 


      it 'displays the litigator account number section' 

    end
  end

  context 'Interim claims' do
    let(:claim) { create(:interim_claim, :interim_effective_pcmh_fee) }

    before do
      assign(:claim, claim)
      assign(:messages, claim.messages.most_recent_last)
      assign(:message, claim.messages.build)
    end

    describe 'basic claim information' do
      it 'displays the fee type section' 


      context 'Effective PCMH' do
        it 'displays the PPE total section' 


        it 'displays the Effective PCMH section' 

      end
    end

    describe 'Fees, expenses and more information' do
      it 'should not show the expenses section' 

    end
  end
end

