require 'rails_helper'

RSpec.describe IncomeCalculation do
  subject(:calculation) { described_class.new(application, income) }

  let(:application) { build :application_part_remission }

  describe '.calculate' do
    subject(:calculated) { calculation.calculate }
    before do
      allow(application).to receive(:income).and_call_original
    end

    context 'when income is not provided explicitly' do
      let(:income) { nil }

      context 'when the application has income thresholds set but not income' do
        context 'when the minimum income threshold has not been exceeded' do
          let(:application) { build :application_part_remission, income: nil, income_min_threshold_exceeded: false }

          it 'results in full remission' 

        end

        context 'when the maximum income threshold has been exceeded' do
          let(:application) { build :application_part_remission, fee: 333, income: nil, income_max_threshold_exceeded: true }

          it 'results in no remission' 

        end
      end

      context 'when the application has income set' do
        it 'uses the income from the application' 


        context 'when data for calculation is present' do
          describe 'for known scenarios' do
            CalculatorTestData.seed_data.each do |src|
              describe "scenario \##{src[:id]} passes" do
                before do
                  application.tap do |a|
                    a.detail.fee = src[:fee]
                    a.applicant.married = src[:married_status]
                    a.children = src[:children]
                    a.income = src[:income]
                  end
                end
                it { expect(calculated[:outcome]).to eql(src[:type]) }
                it { expect(calculated[:amount_to_pay]).to eql(src[:they_pay].to_i) }
                it { expect(calculated[:min_threshold]).not_to be nil }
                it { expect(calculated[:max_threshold]).not_to be nil }
              end
            end
          end
        end

        context 'when children attribute value is nil' do
          before { application.children = nil }

          it { is_expected.not_to be nil }
        end

        context 'when data for calculation is missing' do
          before { application.detail.fee = nil }

          it { is_expected.to be nil }
        end
      end
    end

    context 'when income is provided explicitly' do
      let(:income) { 1000 }

      it 'uses the explicit income for the calculation' 


      context 'when data for calculation is present' do
        it 'returns hash with outcome and amount' 

      end

      context 'when data for calculation is missing' do
        let(:income) { nil }
        before { application.detail.fee = nil }

        it { is_expected.to be nil }
      end
    end
  end
end

