require "rails_helper"


describe ClaimsHelper do

  describe '#claim_allocation_checkbox_helper' do
    let(:case_worker)         { double CaseWorker }
    let(:claim)               { double Claim }

    before(:each) do
      allow(claim).to receive(:id).and_return(66)
      allow(case_worker).to receive(:id).and_return(888)
    end

    it 'should produce the html for a checked checkbox if the claim is allocated to the case worker' 


    it 'should produce the html for a un-checked checkbox if the claim is not allocated to the case worker' 


  end

	describe '#includes_state?' do

		let(:only_allocated_claims) { create_list(:allocated_claim, 5) }

		it "returns true if state included as array" 


		it "returns true if state included as comma delimited string" 


		it "returns false if state NOT included" 

  end

  describe '#show_api_promo_to_user?' do
    helper do
      def current_user
        instance_double(User, setting?: api_promo_seen_setting)
      end
    end

    before do
      allow(Settings).to receive(:api_promo_enabled?).and_return(api_promo_enabled)
    end

    context 'feature flag enabled' do
      let(:api_promo_enabled) { true }

      context 'user has not seen yet the promo' do
        let(:api_promo_seen_setting) { nil }

        it 'should return true' 

      end

      context 'user has seen the promo' do
        let(:api_promo_seen_setting) { '1' }

        it 'should return false' 

      end
    end

    context 'feature flag disabled' do
      let(:api_promo_enabled) { false }

      it 'should return false regardless of the user setting' 

    end
  end

  describe '#show_message_controls?' do
    subject(:subj_show_message_controls?) { show_message_controls?(claim) }
    require 'application_helper'
    let(:claim) { build :claim, state: state }

    RSpec.configure do |c|
      c.include ApplicationHelper
    end

    helper do
      def current_user
        instance_double(User, persona: persona)
      end
    end

    context 'for case_worker' do
      let(:persona) { create :case_worker }

      %w[submitted allocated authorised part_authorised rejected refused redetermination awaiting_written_reasons].each do |state|
        context "when claim state is #{state}" do
          let(:state) { state }

          it { is_expected.to be_truthy }
        end
      end

      %w[draft].each do |state|
        context "when claim state is #{state}" do
          let(:state) { state }

          it { is_expected.to be_falsey }
        end
      end
    end

    context 'for external_user' do
      let(:persona) { create :external_user }

      %w[submitted allocated part_authorised refused authorised redetermination awaiting_written_reasons].each do |state|
        context "when claim state is #{state}" do
          let(:state) { state }

          it { is_expected.to be_truthy }
        end
      end

      %w[draft rejected archived_pending_delete].each do |state|
        context "when claim state is #{state}" do
          let(:state) { state }

          it { is_expected.to be_falsey }
        end
      end
    end

    context 'for user with invalid persona' do
      let(:persona) { nil }
      let(:state) { 'submitted' }

      it { is_expected. to be_falsey }
    end
  end
end

