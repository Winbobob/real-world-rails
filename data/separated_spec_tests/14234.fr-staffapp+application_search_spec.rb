require 'rails_helper'

RSpec.describe ApplicationSearch do
  subject(:service) { described_class.new(reference, user) }

  include Rails.application.routes.url_helpers
  let(:reference) { nil }
  let(:user) { create :staff }

  it { is_expected.to respond_to :error_message }

  describe '#online' do
    subject { service.online }

    let(:existing_reference) { 'HWF-123-ABC' }
    let(:wrong_reference) { 'HWF-WRO-NG' }
    let(:online_application) { build_stubbed(:online_application, reference: existing_reference) }
    let(:online_application_url) { edit_online_application_path(online_application) }

    before do
      allow(OnlineApplication).to receive(:find_by).with(reference: existing_reference).and_return(online_application)
      allow(OnlineApplication).to receive(:find_by).with(reference: wrong_reference).and_return(nil)
    end

    context 'when reference is nil' do
      it { is_expected.to eq nil }
    end

    context 'when an online_application exists' do
      describe 'can be found using various input formats of the reference number' do
        [
          'HWF-123-ABC',
          'HWF 123 ABC',
          'HWF123ABC',
          '123-ABC',
          '123 ABC',
          'hwf-123-abc',
          '123-abc',
          '123 abc'
        ].each do |format|
          context "for '#{format}' format" do
            let(:reference) { format }

            it { is_expected.to eql online_application_url }
          end
        end
      end
    end

    context 'when an application has been processed in my office' do
      let(:reference) { existing_reference }
      let(:application) { build_stubbed(:application, reference: online_application.reference, office: user.office) }

      before do
        allow(Application).to receive(:find_by).with(reference: online_application.reference).and_return(application)
        service.online
      end

      it { is_expected.to be nil }

      it 'sets the correct error message' 

    end

    context 'when an application has been processed by a different office' do
      let(:office) { create :office }
      let(:reference) { existing_reference }
      let(:application) { build_stubbed(:application, reference: online_application.reference, office: office) }

      before do
        allow(Application).to receive(:find_by).with(reference: online_application.reference).and_return(application)
        service.online
      end

      it { is_expected.to be nil }

      it 'sets the correct error message' 

    end

    context 'when the reference is not there' do
      let(:reference) { wrong_reference }

      before { service.online }

      it { is_expected.to be nil }

      it 'sets the correct error message' 

    end

    context 'when the application has been submitted with invalid data' do
      let(:reference) { existing_reference }
      let(:invalid_online_application) { build_stubbed(:online_application, :invalid_income, reference: existing_reference) }

      before do
        allow(OnlineApplication).to receive(:find_by).with(reference: existing_reference).and_return(invalid_online_application)
        service.online
      end

      it { is_expected.to be nil }

      it 'sets the correct error message' 

    end
  end

  describe '#completed' do
    subject(:service_completed) { service.completed }

    let(:existing_reference) { 'XYZ-123-ABC' }
    let(:wrong_reference) { 'XYZ-WRO-NG' }
    let(:application) { build_stubbed(:application) }

    before do
      allow(Application).to receive(:find_by).with(reference: existing_reference).and_return(application)
      allow(Application).to receive(:find_by).with(reference: wrong_reference).and_return(nil)
    end

    context 'when there is an application with the given reference' do
      let(:reference) { existing_reference }

      context 'when the application has been processed in the same office' do
        context 'when waiting for evidence' do
          let(:evidence_check) { build_stubbed(:evidence_check) }
          let(:application) { build_stubbed(:application, :waiting_for_evidence_state, reference: reference, office: user.office, evidence_check: evidence_check) }

          it 'returns the evidence check url' 

        end

        context 'when waiting for part payment' do
          let(:part_payment) { build_stubbed(:part_payment) }
          let(:application) { build_stubbed(:application, :waiting_for_part_payment_state, reference: reference, office: user.office, part_payment: part_payment) }

          it 'returns the part payment url' 

        end

        context 'when processed' do
          let(:application) { build_stubbed(:application, :processed_state, reference: reference, office: user.office) }

          it 'returns the processed application url' 

        end

        context 'when deleted' do
          let(:application) { build_stubbed(:application, :deleted_state, reference: reference, office: user.office) }

          it 'returns the deleted application url' 

        end
      end

      context 'when the application has not been processed in the same office' do
        let(:office) { build_stubbed :office }
        let(:application) { build_stubbed(:application, :processed_state, reference: reference, office: office) }

        it { is_expected.to be nil }

        it 'sets the correct error message' 

      end

      context 'when the application has not yet been completed' do
        let(:application) { build_stubbed(:application, reference: reference) }

        it { is_expected.to be nil }

        it 'sets the correct error message' 

      end
    end

    context 'when there is no application with the given reference' do
      let(:reference) { wrong_reference }

      it { is_expected.to be nil }

      it 'sets the correct error message' 

    end
  end
end

