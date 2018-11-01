require 'rails_helper'

RSpec.describe ExternalUsers::ClaimsController, type: :controller, focus: true do
  let!(:advocate) { create(:external_user, :advocate) }

  before { sign_in advocate.user }

  context "list views" do
    let!(:advocate_admin) { create(:external_user, :admin, provider: advocate.provider) }
    let!(:other_advocate) { create(:external_user, :advocate, provider: advocate.provider) }

    let!(:litigator)      { create(:external_user, :litigator) }
    let!(:litigator_admin){ create(:external_user, :litigator_and_admin, provider: litigator.provider) }
    let!(:other_litigator){ create(:external_user, :litigator, provider: litigator.provider) }

    describe '#GET index' do

      it 'returns success' 


      it 'renders the template' 


      it 'assigns the financial summary' 


      context 'AGFS claims' do
        before do
          create(:draft_claim, external_user: advocate)
          create(:archived_pending_delete_claim, external_user: advocate)
          create(:draft_claim, external_user: other_advocate)
        end

        context 'advocate' do
          it 'should assign context to claims for the advocate only' 

          it 'should assign claims to dashboard displayable state claims for the advocate only' 

        end

        context 'advocate admin' do
          before { sign_in advocate_admin.user }
          it 'should assign context to claims for the provider' 

          it 'should assign claims to dashboard displayable state claims for all members of the provder' 

        end
      end

      context 'LGFS claims' do
        before do
          @draft_claim = create(:litigator_claim, :draft, external_user: litigator, creator: litigator)
          create(:litigator_claim, :archived_pending_delete, external_user: litigator, creator: litigator)
          create(:litigator_claim, :draft, external_user: other_litigator, creator: other_litigator)
        end

        context 'litigator' do
          before { sign_in litigator.user }
          it 'should assign context to claims for the provider' 


          it 'should assign claims to dashboard displayable state claims for all members of the provder' 

        end

        context 'litigator admin' do
          before { sign_in litigator_admin.user }
          it 'should assign context to claims for the provider' 


          it 'should assign claims to dashboard displayable state claims for all members of the provder' 

        end
      end

      context 'scheme filtering' do
        before do
          sign_in advocate_admin.user
          get :index, params: query_params
        end

        context 'ALL filter' do
          let(:query_params) { {scheme: 'all'} }

          it 'should assign context to claims for the provider' 

        end

        context 'AGFS filter' do
          let(:query_params) { {scheme: 'agfs'} }

          it 'should assign context to claims for the provider' 

        end

        context 'LGFS filter' do
          let(:query_params) { {scheme: 'lgfs'} }

          it 'should assign context to claims for the provider' 

        end
      end

      context 'sorting' do
        let(:query_params) { {} }
        let(:limit) { 10 }

        # This bypass the top-level 'let', making this whole context 10x faster by allowing to create
        # all the needed claims once, in a before(:all) block, and test all the sorting reusing them.
        def advocate
          @advocate ||= create(:external_user, :advocate)
        end

        before(:all) do
          build_sortable_claims_sample(advocate)
        end

        after(:all) do
          clean_database
        end

        before(:each) do
          allow(subject).to receive(:page_size).and_return(limit)
          sign_in advocate.user
          get :index, params: query_params
        end

        it 'default sorting is claims with draft first (oldest created first) then oldest submitted' 


        context 'case number ascending' do
          let(:query_params) { {sort: 'case_number', direction: 'asc'} }

          it 'returns ordered claims' 

        end

        context 'case number descending' do
          let(:query_params) { {sort: 'case_number', direction: 'desc'} }

          it 'returns ordered claims' 

        end

        context 'advocate name ascending' do
          let(:query_params) { {sort: 'advocate', direction: 'asc'} }

          it 'returns ordered claims' 

        end

        context 'advocate name descending' do
          let(:query_params) { {sort: 'advocate', direction: 'desc'} }

          it 'returns ordered claims' 

        end

        context 'claimed amount ascending' do
          let(:query_params) { {sort: 'total_inc_vat', direction: 'asc'} }

          it 'returns ordered claims' 

        end

        context 'claimed amount descending' do
          let(:query_params) { {sort: 'total_inc_vat', direction: 'desc'} }

          it 'returns ordered claims' 

        end

        context 'assessed amount ascending' do
          let(:query_params) { {sort: 'amount_assessed', direction: 'asc'} }

          it 'returns ordered claims' 

        end

        context 'assessed amount descending' do
          let(:query_params) { {sort: 'amount_assessed', direction: 'desc'} }

          it 'returns ordered claims' 

        end

        context 'status ascending' do
          let(:query_params) { {sort: 'state', direction: 'asc'} }

          it 'returns ordered claims' 

        end

        context 'status descending' do
          let(:query_params) { {sort: 'state', direction: 'desc'} }

          it 'returns ordered claims' 

        end

        context 'date submitted ascending' do
          let(:query_params) { {sort: 'last_submitted_at', direction: 'asc'} }

          it 'returns ordered claims' 

        end

        context 'date submitted descending' do
          let(:query_params) { {sort: 'last_submitted_at', direction: 'desc'} }

          it 'returns ordered claims' 

        end

        context 'pagination limit' do
          let(:limit) { 3 }

          it 'paginates to N per page' 

        end
      end
    end

    describe '#GET archived' do

      it 'returns success' 


      it 'renders the template' 


      context 'AGFS claims' do
        before do
          create(:draft_claim, external_user: advocate)
          create(:archived_pending_delete_claim, external_user: advocate)
          create(:draft_claim, external_user: other_advocate)
        end

        context 'advocate' do
          before { sign_in advocate.user }
          it 'should assign context to provider claims based on external user' 

          it 'should assign claims to archived only' 

        end

        context 'advocate admin' do
          before { sign_in advocate_admin.user }
          it 'should assign context to provider claims based on external user' 

          it 'should assign claims to archived only' 

        end
      end

      context 'LGFS claims' do
        before do
          create(:litigator_claim, :draft, external_user: litigator, creator: litigator)
          create(:litigator_claim, :archived_pending_delete, external_user: litigator, creator: litigator)
          create(:litigator_claim, :draft, external_user: other_litigator, creator: other_litigator)
        end

        context 'litigator' do
          before { sign_in litigator.user }
          it 'should see same context and claims as a litigator admin' 

        end

        context 'litigator admin' do
          before { sign_in litigator_admin.user }
          it 'should assign context to claims created by all members of the provider' 

          it 'should retrieve archived state claims only' 

        end
      end

      context 'sorting' do
        let(:limit) { 10 }

        before(:each) do
          create_list(:archived_pending_delete_claim, 3, external_user: advocate).each { |c| c.update_column(:last_submitted_at, 8.days.ago) }
          create(:archived_pending_delete_claim, external_user: advocate).update_column(:last_submitted_at, 1.day.ago)
          create(:archived_pending_delete_claim, external_user: advocate).update_column(:last_submitted_at, 2.days.ago)

          allow(subject).to receive(:page_size).and_return(limit)
          get :archived
        end

        it 'orders claims with most recently submitted first' 


        context 'pagination limit' do
          let(:limit) { 3 }

          it 'paginates to N per page' 

        end
      end
    end

    describe '#GET outstanding' do
      before(:each) do
        get :outstanding
      end

      it 'returns success' 


      it 'renders the template' 


      it 'assigns the financial summary' 


      context 'AGFS claims' do
        before do
          create(:submitted_claim, external_user: advocate)
          create(:draft_claim, external_user: advocate)
          create(:archived_pending_delete_claim, external_user: advocate)
        end

        context 'advocate' do
          before { sign_in advocate.user }

          it 'should assign outstanding claims' 

        end

        context 'advocate admin' do
          before { sign_in advocate_admin.user }

          it 'should assign outstanding claims' 

        end
      end
    end

    describe '#GET authorised' do
      before(:each) do
        get :authorised
      end

      it 'returns success' 


      it 'renders the template' 


      it 'assigns the financial summary' 


      context 'AGFS claims' do
        before do
          create(:authorised_claim, external_user: advocate)
          create(:part_authorised_claim, external_user: advocate)
          create(:archived_pending_delete_claim, external_user: advocate)
        end

        context 'advocate' do
          before { sign_in advocate.user }

          it 'should assign authorised and part authorised claims' 

        end

        context 'advocate admin' do
          before { sign_in advocate_admin.user }

          it 'should assign authorised and part authorised claims' 

        end
      end
    end

    describe 'Search' do
      let(:advocate) { create(:external_user, :advocate) }

      before do
        @archived_claim = create(:archived_pending_delete_claim, external_user: advocate)
        create(:defendant, claim: @archived_claim, first_name: 'John', last_name: 'Smith')

        @draft_claim = create(:draft_claim, external_user: advocate)
        create(:defendant, claim: @draft_claim, first_name: 'John', last_name: 'Smith')

        @allocated_claim = create(:allocated_claim, external_user: advocate)
        create(:defendant, claim: @allocated_claim, first_name: 'Pete', last_name: 'Adams')
      end

      context 'in all claims' do
        context 'by defendant name' do
          it 'finds the claims' 

        end

        context 'by advocate name' do
          let(:params) { { search: advocate.user.last_name } }

          it 'returns no claims by default' 


          context 'when advocate is an admin' do
            let(:advocate) { create(:external_user, :advocate, :admin) }

            it 'finds the claims' 

          end
        end
      end

      context 'in archive' do
        context 'by defendant name' do
          it 'finds the claims' 

        end

        context 'by advocate name' do
          let(:params) { { search: advocate.user.last_name } }

          it 'returns no claims by default' 


          context 'when advocate is an admin' do
            let(:advocate) { create(:external_user, :advocate, :admin) }

            it 'finds the claims' 

          end
        end
      end
    end
  end

  describe "GET #show" do
    subject { create(:claim, external_user: advocate) }

    let(:case_worker) { create(:case_worker) }

    it "returns http success" 


    it 'assigns @claim' 


    it 'renders the template' 


    it 'automatically marks unread messages on claim for current user as "read"' 

  end

  describe 'GET #disc_evidence' do
    before { get :disc_evidence, params: { id: claim } }

    let(:claim) { create(:claim, external_user: advocate) }

    it 'returns http success' 


    it 'returns the pdf mime type' 

  end

  describe 'GET #calculate_unit_price.json' do
    # IMPORTANT: use specific case type, offence class, fee types and reporder
    # date in order to reduce and afix VCR cassettes required (that have to match
    # on query values), prevent flickering specs (from random offence classes,
    # rep order dates) and to allow testing actual amounts "calculated".
    let(:claim) do
      create(:draft_claim,
        create_defendant_and_rep_order: false,
        create_defendant_and_rep_order_for_scheme_9: true,
        case_type: case_type, offence: offence
      )
    end
    let(:case_type) { create(:case_type, :appeal_against_conviction) }
    let(:offence_class) { create(:offence_class, class_letter: 'K') }
    let(:offence) { create(:offence, offence_class: offence_class) }
    let(:fee_type) { create(:fixed_fee_type, :fxacv) }
    let(:fee) { create(:fixed_fee, fee_type: fee_type, claim: claim, quantity: 1) }

    let(:calculator_params) do
      {
        format: :json,
        id: claim.id,
        advocate_category: 'Junior alone',
        fee_type_id: fee.fee_type.id,
        fees: {
          "0": { fee_type_id: fee.fee_type.id, quantity: fee.quantity }
        }
      }
    end

    before { get :calculate_unit_price, params: calculator_params }

    context 'success', :fee_calc_vcr do
      it 'returns http success' 


      it 'returns JSON' 


      it 'returns success? true' 

    end

    context 'failure', :fee_calc_vcr do
      before do
        calculator_params.merge!('advocate_category' => 'Rubbish')
        get :calculate_unit_price, params: calculator_params
      end

      it 'returns unprocessible entity' 


      it 'returns JSON' 


      it 'returns success? false' 


      it 'returns JSON errors array' 


      it 'returns JSON error message string' 

    end
  end

  describe "PATCH #clone_rejected" do
    context 'from rejected claim' do
      subject { create(:rejected_claim, external_user: advocate) }

      before do
        patch :clone_rejected, params: { id: subject }
      end

      it 'creates a draft from the rejected claim' 


      it 'redirects to the draft\'s edit page' 

    end

    context 'from non-rejected claim' do
      subject { create(:submitted_claim, external_user: advocate) }

      it 'logs the actual error message' 


      describe 'the response' do
        before do
          patch :clone_rejected, params: { id: subject }
        end

        it 'redirects to advocates dashboard' 


        it 'does not create a draft claim' 


        it'displays a flash error' do
          expect(flash[:alert]).to eq 'An error is preventing this claim from being redrafted.  The problem has been logged and is being investigated. To continue please start a new claim.'
        end
      end
    end
  end

  describe "DELETE #destroy" do
    before { delete :destroy, params: { id: claim } }

    context 'when draft claim' do
      let(:claim) { create(:draft_claim, external_user: advocate) }

      it 'deletes the claim' 


      it 'redirects to advocates root url' 

    end

    context 'when non-draft claim in a valid state for archival' do
      let(:claim) { create(:authorised_claim, external_user: advocate) }

      it "sets the claim's state to 'archived_pending_delete'" 

    end

    context 'when non-draft claim in an invalid state for archival' do
      let(:claim) { create(:archived_pending_delete_claim, external_user: advocate) }

      it 'responds with an error' 

    end
  end

  describe "PATCH #unarchive" do
    context 'when archived claim' do
      let(:claim) do
        claim = create(:authorised_claim, external_user: advocate)
        claim.archive_pending_delete!
        claim
      end

      context 'when the current version of paper trail is used' do
        before { patch :unarchive, params: { id: claim } }

        it 'unarchives the claim and restores to state prior to archiving' 


        it 'redirects to external users root url' 

      end
    end

    context 'when archived claim has null vat totals' do
      it 'sets the vat totals to zero' 

    end

    context 'when non-archived claim' do
      subject { create(:part_authorised_claim, external_user: advocate) }

      before { patch :unarchive, params: { id: subject } }

      it 'does not change the claim state' 


      it 'redirects to external users root url' 

    end
  end

  describe 'GET #show_message_controls' do
    let(:claim) { create :refused_claim, external_user: advocate }

    it 'does something' 

  end
end

def build_claim_in_state(state)
  claim = FactoryBot.build :unpersisted_claim
  allow(claim).to receive(:state).and_return(state.to_s)
  claim
end

def build_sortable_claims_sample(advocate)
  [:draft, :submitted, :allocated, :authorised, :rejected].each_with_index do |state, i|
    Timecop.freeze(i.days.ago) do
      n = i+1
      claim = create("#{state}_claim".to_sym, external_user: advocate, case_number: "A2016#{(n).to_s.rjust(4,'0')}")
      claim.fees.destroy_all
      claim.expenses.destroy_all

      # cannot stub/mock here so temporarily change state to draft to enable amount calculation of fees
      old_state = claim.state
      claim.state = 'draft'
      create(:misc_fee, claim: claim, quantity: n*1, rate: n*1)
      claim.state = old_state
      claim.assessment.update_values!(claim.fees_total, 0, 0) if claim.authorised?
    end
  end
end

