require 'rails_helper'

RSpec.describe IncomeCalculationRunner do
  subject(:runner) { described_class.new(application) }

  let(:application) { create :application, application_type: nil, outcome: nil }

  describe '#run' do
    let(:calculation) { instance_double(IncomeCalculation, calculate: result) }

    before do
      allow(IncomeCalculation).to receive(:new).with(application).and_return(calculation)

      runner.run

      application.reload
    end

    context 'when result is not nil' do
      let(:result) { { outcome: 'part', amount_to_pay: 100, min_threshold: 1000, max_threshold: 5000 } }

      it 'sets application type to income' 


      it 'sets application outcome as per result' 


      it 'sets amount_to_pay as per result' 


      it 'sets min_threshold as per result' 


      it 'sets max_threshold as per result' 

    end

    context 'when result is nil' do
      let(:result) { nil }

      it 'does not set application type' 


      it 'does not set application outcome' 

    end

  end
end

