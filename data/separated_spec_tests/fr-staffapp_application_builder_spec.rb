require 'rails_helper'

RSpec.describe ApplicationBuilder do

  let(:user) { create :user }
  let(:application_builder) { described_class.new(user) }
  let(:entity_code) { user.office.entity_code }
  let(:current_time) { Time.zone.now }
  let(:current_year) { current_time.strftime('%y') }
  let(:counter) do
    Reference.where("reference like ?", "#{entity_code}-#{current_year}-%").count + 1
  end

  describe '#build' do
    subject(:build_result) do
      Timecop.freeze(current_time) do
        application_builder.build
      end
    end

    describe 'builds and returns non persisted Application' do
      it { is_expected.to be_a(Application) }
      it { is_expected.not_to be_persisted }
    end

    describe 'the application' do
      it 'has the user stored' 


      it 'has office assigned from the user' 


      describe 'has applicant record built' do
        it { expect(build_result.applicant).to be_a(Applicant) }
        it { expect(build_result.applicant).not_to be_persisted }
      end

      describe 'has detail record built' do
        it { expect(build_result.detail).to be_a(Detail) }
        it { expect(build_result.detail).not_to be_persisted }
      end

      describe 'has saving record built' do
        it { expect(build_result.saving).to be_a(Saving) }
        it { expect(build_result.saving).not_to be_persisted }
      end

      it 'has jurisdiction assigned to the detail from the user' 


      it 'does not have reference set' 

    end
  end

  describe '#build_from' do
    subject(:built_application) do
      Timecop.freeze(current_time) do
        application_builder.build_from(online_application)
      end
    end

    let(:online_application) { build_stubbed(:online_application_with_all_details, :with_reference, :completed) }

    describe 'builds and returns non persisted Application' do
      it { is_expected.to be_a(Application) }
      it { is_expected.not_to be_persisted }
    end

    describe 'the application' do
      it 'has the user stored' 


      it 'has office assigned from the user' 


      it 'references the online application' 


      it 'has reference from the online application' 


      it 'sets the current min_thresholds' 


      it 'sets the current max_thresholds' 


      [:benefits, :income].each do |column|
        it "has #{column} assigned" 

      end

      context 'when the online application has income thresholds instead of income' do
        context 'when the minimum threshold has not been exceeded' do
          let(:online_application) { build_stubbed(:online_application_with_all_details, :with_reference, :completed, income: nil, income_min_threshold_exceeded: false) }

          it 'has income_min_threshold_exceeded assigned' 

        end

        context 'when the maximum threshold has been exceeded' do
          let(:online_application) { build_stubbed(:online_application_with_all_details, :with_reference, :completed, income: nil, income_max_threshold_exceeded: true) }

          it 'has income_max_threshold_exceeded assigned' 

        end
      end

      context 'when the online application has children' do
        let(:online_application) { build_stubbed(:online_application_with_all_details, children: 2) }

        it 'has the dependents flag set to true' 


        it 'has the children number set' 

      end

      context 'when the online application does not have children' do
        let(:online_application) { build_stubbed(:online_application_with_all_details, children: 0) }

        it 'has the dependents flag set to false' 


        it 'has the children number set as 0' 

      end

      context 'when the online application does not specify children' do
        let(:online_application) { build_stubbed(:online_application_with_all_details, children: nil) }

        it 'has the dependents flag not to be set' 


        it 'has the children number set as nil' 

      end

      describe 'has applicant record built' do
        it { expect(built_application.applicant).to be_a(Applicant) }
        it { expect(built_application.applicant).not_to be_persisted }
      end

      describe 'the applicant' do
        subject(:built_applicant) { built_application.applicant }

        [:title, :first_name, :last_name, :date_of_birth, :ni_number, :married].each do |column|
          it "has #{column} assigned" 

        end
      end

      describe 'has detail record built' do
        it { expect(built_application.detail).to be_a(Detail) }
        it { expect(built_application.detail).not_to be_persisted }
      end

      describe 'the detail' do
        subject(:built_detail) { built_application.detail }

        [:fee, :jurisdiction, :date_received, :form_name, :case_number, :probate, :deceased_name, :date_of_death, :refund, :date_fee_paid, :emergency_reason].each do |column|
          it "has #{column} assigned" 

        end
      end

      describe 'has savings record built' do
        it { expect(built_application.saving).to be_a(Saving) }
        it { expect(built_application.saving).not_to be_persisted }
      end

      describe 'the saving' do
        subject(:built_saving) { built_application.saving }

        [:min_threshold_exceeded, :max_threshold_exceeded, :amount, :over_61].each do |column|
          it "has #{column} assigned" 

        end
      end
    end
  end
end

