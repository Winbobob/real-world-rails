require 'rails_helper'

RSpec.describe Claims::CaseWorkerClaimUpdater do
  let(:current_user) { create(:user) }

  shared_examples 'a successful non-authorised claim with a single reason' do |state|
    it_behaves_like 'non-authorised claim', state, ['no_indictment']
  end

  shared_examples 'a successful non-authorised claim with other as reason' do |state, state_reason=['other']|
    it_behaves_like 'non-authorised claim', state, state_reason, 'a reason'
  end

  shared_examples 'non-authorised claim' do |state, state_reason, reason_text=nil|
    subject(:updater) { described_class.new(claim.id, params.merge(current_user: current_user)) }
    let(:claim) { create :allocated_claim }
    let(:params) do
      {
        'state' => state,
        'state_reason' => state_reason,
        "#{state.eql?('rejected') ? 'reject' : 'refuse'}_reason_text" => reason_text,
        'assessment_attributes' => {'fees' => '', 'expenses' => '0'}
      }
    end

    before do |example|
      updater.update! unless example.metadata[:wait]
    end

    it 'returns :ok' 


    it "updates state to #{state}" 


    it 'adds claim state transition details' 


    it 'adds message to the claim', :wait do
      expect { updater.update! }.to change(updater.claim.messages, :count).by(1)
    end
  end

  shared_examples 'a successful assessment' do |state, fees='128.33', expenses='42.40'|
    subject(:updater) { described_class.new(claim.id, params.merge(current_user: current_user)) }
    let(:claim) { create :allocated_claim }
    let(:params) do
      {
        'state' => state,
        'state_reason' => [],
        'reject_reason_text' => '',
        'refuse_reason_text' => '',
        'assessment_attributes' => {'fees' => fees, 'expenses' => expenses}
      }
    end

    before do |example|
      updater.update! unless example.metadata[:wait]
    end

    it 'returns :ok' 


    it "updates state to #{state}" 


    it 'updates the assessment' 


    it 'adds claim state transition details' 


    it 'does not add message to the claim', :wait do
      expect { updater.update! }.to_not change(updater.claim.messages, :count)
    end
  end

  shared_examples 'an erroneous determination' do |state, expected_error, determination_type = 'redeterminations', state_reason = [], fees = '128.33', expenses = '42.40', error_field = :determinations|
    subject(:updater) { described_class.new(claim.id, params.merge(current_user: current_user)) }
    let(:claim) { create :allocated_claim }
    let(:assessment_attributes) { { 'fees' => fees, 'expenses' => expenses } }
    let(:redeterminations_attributes) { { '0' => { 'fees' => fees, 'expenses' => expenses } } }
    let(:params) do
      {
        'state' => state,
        'state_reason' => state_reason,
        'reject_reason_text' => '',
        'refuse_reason_text' => '',
        "#{determination_type}_attributes" => send("#{determination_type}_attributes")
      }
    end

    before do |example|
      updater.update! unless example.metadata[:wait]
    end

    it 'returns :error' 


    it 'does NOT update state' 


    it "does NOT add #{determination_type}" 


    it 'does NOT add message to the claim', :wait do
      expect { updater.update! }.to_not change(updater.claim.messages, :count)
    end

    it 'adds errors on claim' 

  end

  context 'assessments' do
    let(:claim) { create :allocated_claim }

    context 'successful transitions' do
      context 'advances the claim to part authorised' do
        it_behaves_like 'a successful assessment', 'part_authorised', 45.0, 0
      end

      context 'advances the claim to authorised' do
        it_behaves_like 'a successful assessment', 'authorised', 128.33, 42.88
      end

      context 'rejections' do
        it_behaves_like 'a successful non-authorised claim with a single reason', 'rejected'
        it_behaves_like 'a successful non-authorised claim with other as reason', 'rejected'
      end

      context 'refusals' do
        it_behaves_like 'a successful non-authorised claim with a single reason', 'refused'
        it_behaves_like 'a successful non-authorised claim with other as reason', 'refused', ['other_refuse']
      end

      it 'advances the claim to refused when no values are supplied' 

    end

    context 'errors' do
      it 'errors if no state and and no values submitted' 


      it 'errors if part auth selected and no values' 


      it 'errors if assessment data is present in the params but no state specified' 


      it 'errors if values are supplied with refused' 


      it 'errors if values are supplied with rejected' 


      it 'if rejected and no state_reason are supplied' 


      it 'if rejected, state_reason is other and no text is supplied' 


      it 'if refused and no state_reason are supplied' 


      it 'if refused, state_reason is other and no text is supplied' 


      context 'transactional rollback' do
        subject(:updater) { described_class.new(claim.id, params).update! }
        let(:claim) { create :claim, :submitted }
        let(:params) { { 'state' => 'authorised', 'assessment_attributes' => {'fees' => '200', 'expenses' => '0.00'} } }

        it 'returns result of :error' 


        it 'adds error to its instance claim object' 


        it 'instance data remains in pre-transactional state' 


        it 'does not persist the change' 

      end
    end
  end

  context 'rejections' do
    subject(:updater) { described_class.new(claim.id, params.merge(current_user: current_user)) }
    let(:claim) { create :allocated_claim }

    before do |example|
      updater.update! unless example.metadata[:wait]
    end

    # TODO to be removed post release
    around do |example|
      travel_to(Settings.reject_refuse_messaging_released_at + 1) do
        example.run
      end
    end

    context 'with reasons' do
      let(:params) do
        {
          'state' => 'rejected',
          'state_reason' => %w[wrong_maat_ref no_indictment other],
          'reject_reason_text' => 'rejecting because...',
          'assessment_attributes' => {'fees' => '', 'expenses' => '0'}
        }
      end

      it 'changes state to rejected' 


      it 'adds message to the claim', :wait do
        expect { updater.update! }.to change(claim.messages, :count).by(1)
      end
    end
  end

  context 'refusals' do
    subject(:updater) { described_class.new(claim.id, params.merge(current_user: current_user)) }
    let(:claim) { create :allocated_claim }

    before do |example|
      updater.update! unless example.metadata[:wait]
    end

    # TODO to be removed post release
    around do |example|
      travel_to(Settings.reject_refuse_messaging_released_at + 1) do
        example.run
      end
    end

    context 'with reasons' do
      let(:params) do
        {
          'state' => 'refused',
          'state_reason' => %w[wrong_ia duplicate_claim other_refuse],
          'refuse_reason_text' => 'refusing because...',
          'assessment_attributes' => {'fees' => '', 'expenses' => '0'}
        }
      end

      it 'changes state to refused' 


      it 'adds message to the claim', :wait do
        expect { updater.update! }.to change(claim.messages, :count).by(1)
      end
    end
  end

  context 'redeterminations' do
    let(:claim) {
      create(:allocated_claim).tap do |c|
        c.assessment.update(fees: 200.15, expenses: 77.66)
      end
    }

    context 'successful transitions' do
      it 'advances the claim to part authorised' 


      it 'advances the claim to authorised' 


      it 'advances the claim to refused when no values are supplied' 

    end

    context 'errors' do
      it 'errors if assessment data is present in the params but no state specified' 


      context 'when determination values are supplied with refused' do
        it_behaves_like 'an erroneous determination', 'refused', ['must not have values when refusing a claim'], 'assessment'
        it_behaves_like 'an erroneous determination', 'refused', ['must not have values when refusing a claim'], 'redeterminations'
      end

      context 'when determination values are supplied with rejected' do
        it_behaves_like 'an erroneous determination', 'rejected', ['must not have values when rejecting a claim'], 'assessment'
        it_behaves_like 'an erroneous determination', 'rejected', ['must not have values when rejecting a claim'], 'redeterminations'
      end

      context 'when no reasons are supplied with rejected/refused' do
        it_behaves_like 'an erroneous determination', 'rejected', ['requires a reason'], 'redeterminations', [''], '', 0, :rejected_reason
        it_behaves_like 'an erroneous determination', 'refused', ['requires a reason'], 'redeterminations', [''], '', 0, :refused_reason
      end

      context 'when other reason given without reason text' do
        it_behaves_like 'an erroneous determination', 'rejected', ['needs a description'], 'redeterminations', ['other'], 0, 0, :rejected_reason_other
      end

      context 'when reasons given for authorised claims' do
        it_behaves_like 'an erroneous determination', 'authorised', ['must not provide reject/refuse reasons'], 'assessment', ['no_indictment']
        it_behaves_like 'an erroneous determination', 'authorised', ['must not provide reject/refuse reasons'], 'redeterminations', ['wrong_ia']
      end
    end
  end
end


