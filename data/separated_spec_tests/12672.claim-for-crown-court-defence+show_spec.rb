require 'rails_helper'

describe 'case_workers/claims/show.html.haml', type: :view do
  include ViewSpecHelper
  let!(:lgfs_scheme_nine) { FeeScheme.find_by(name: 'LGFS', version: 9) || create(:fee_scheme, :lgfs_nine) }
  let!(:agfs_scheme_nine) { FeeScheme.find_by(name: 'AGFS', version: 9) || create(:fee_scheme, :agfs_nine) }
  let!(:agfs_scheme_ten) { FeeScheme.find_by(name: 'AGFS', version: 10) || create(:fee_scheme) }

  before do
    @case_worker = create(:case_worker)
    initialize_view_helpers(view)
    sign_in(@case_worker.user, scope: :user)
    allow(view).to receive(:current_user_persona_is?).and_return(false)
  end

  context 'certified claims' do
    before do
      certified_claim
      assign(:claim, @claim)
      render
    end

    it 'displays the name of the external user' 


    it 'shows the reason for certification' 

  end

  context 'trial and retrial claims' do
    it 'shows trial details' 


    it 'shows retrial details' 

  end

  context 'document checklist' do
    let!(:claim_with_doc) { create :claim }
    let!(:document) { create :document, :verified, claim: claim_with_doc }

    before do
      allow(view).to receive(:current_user_persona_is?).with(CaseWorker).and_return(true)
      assign(:claim, claim_with_doc)
      render
    end

    it 'displays a `download all` link' 

  end

  context 'reject/refuse reasons' do
    let(:claim) { create(:allocated_claim) }

    context 'after messaging feature released' do
      context 'rejected claims' do
        let(:reason_code) { %w[no_amend_rep_order other] }

        before do
          travel_to(Settings.reject_refuse_messaging_released_at + 1) do
            claim.reject!(reason_code: reason_code, reason_text: 'rejecting because...')
          end
          @messages = claim.messages.most_recent_last
          @message = claim.messages.build
          assign(:claim, claim.reload)
          render
        end

        it 'does not render reasons section content' 

      end
    end

    context 'before messaging feature released' do
      let(:reason_code) { %w[no_amend_rep_order] }

      context 'rejected claims' do
        before do |example|
          travel_to(Settings.reject_refuse_messaging_released_at - 1) do
            claim.reject!(reason_code: reason_code, reason_text: 'rejecting because...')
          end
          @messages = claim.messages.most_recent_last
          @message = claim.messages.build
          allow_any_instance_of(ClaimStateTransition).to receive(:reason_code).and_return('wrong_case_no') if example.metadata[:legacy]
          assign(:claim, claim)
          render
        end

        it 'has the correct status display' 


        it 'renders the reason header with the correct tense' 


        it 'renders the full text of the reason' 


        context 'with multiple reasons' do
          let(:reason_code) { %w[no_amend_rep_order case_still_live other] }

          it 'renders the reason header with the correct tense' 


          it 'renders the full text of the reasons' 

        end

        context 'legacy cases with non-array reason codes', :legacy do
          it 'renders the full text of the reason' 

        end
      end
    end
  end

  context 'injection errors' do
    before do
      certified_claim
      create(:injection_attempt, :with_errors, claim: @claim)
      assign(:claim, @claim)
      render
    end

    it 'displays summary errors' 


    it 'displays each error message' 

  end

  def certified_claim
    eu = create(:external_user, :advocate, user: create(:user, first_name: 'Stepriponikas', last_name: 'Bonstart'))
    @claim = create(:allocated_claim, external_user: eu)
    @claim.certification.destroy unless @claim.certification.nil?
    certification_type = FactoryBot.create(:certification_type, name: 'which ever reason i please')
    FactoryBot.create(:certification, claim: @claim, certified_by: 'Bobby Legrand', certification_type: certification_type)
    @case_worker.claims << @claim
    @claim.reload
    @message = @claim.messages.build
    @claim
  end

  def trial_claim(trial_prefix = nil)
    @claim = create(:submitted_claim, case_type: FactoryBot.create(:case_type, "#{trial_prefix}trial".to_sym), evidence_checklist_ids: [1, 9])
    @case_worker.claims << @claim
    create(:document, claim_id: @claim.id, form_id: @claim.form_id)
    @message = @claim.messages.build
    @claim
  end
end

