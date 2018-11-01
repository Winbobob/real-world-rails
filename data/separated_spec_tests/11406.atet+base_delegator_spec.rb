require 'rails_helper'

RSpec.describe PdfForm::BaseDelegator, type: :presenter do
  let(:pdf_form_base_delagator) { described_class.new(nil) }

  describe '#format_postcode' do
    context 'for valid UK postcodes' do
      describe 'returns padded, formatted postcodes' do
        it { expect(pdf_form_base_delagator.format_postcode('w1a 1hq')).to eq('W1A 1HQ') }
        it { expect(pdf_form_base_delagator.format_postcode('m1 1aa')).to eq('M1  1AA') }
        it { expect(pdf_form_base_delagator.format_postcode('dn551pt')).to eq('DN551PT') }
        it { expect(pdf_form_base_delagator.format_postcode('a99aa')).to eq('A9  9AA') }
        it { expect(pdf_form_base_delagator.format_postcode('1065')).to eq('1065') }
      end
    end

    context 'for invalid uk postcodes, i.e. international postcodes' do
      it 'does not format the result' 

    end

    context 'for nil' do
      it 'returns an empty string' 

    end
  end

  describe '#use_of_off' do
    it 'returns field when set' 


    it 'returns Off when not set' 

  end

  describe '#tri_state' do
    it 'returns Off when nil' 


    it 'returns no when false' 


    it 'returns yes when true' 


    it 'returns value for yes when true and passed value' 

  end

  describe '#dual_state' do
    it 'returns Off when nil' 


    it 'returns Off when false' 


    it 'returns yes when true' 


    it 'returns value for yes when true and passed value' 

  end

  describe '#format_date' do
    it 'returns a date in the format DD/MM/YYYY' 

  end
end

