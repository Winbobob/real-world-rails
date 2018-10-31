require 'rails_helper'

RSpec.describe DiversitiesHelper, type: :helper do

  let(:fee_label) { 'Fee' }

  describe 'religion_value' do
    context 'when called with empty value' do
      it do
        object = instance_double(Diversities::ReligionForm, religion_text: nil, religion: nil)
        expect(helper.religion_value(object)).to be_nil
      end
    end

    context 'when called with religion value' do
      it 'use the translation key' 

    end

    context 'when called with free text value' do
      it 'return the free text value' 

    end
  end
end

