require 'rails_helper'

RSpec.describe SummaryHelper, type: :helper do

  let(:fee_label) { 'Fee' }

  before do
    i18n_key = 'activemodel.attributes.r_spec/mocks/instance_verifying_double.'
    i18n_fee = "#{i18n_key}fee"
    i18n_name = "#{i18n_key}form_name"
    i18n_date = "#{i18n_key}date_received"
    allow(I18n).to receive(:t).with(i18n_fee).and_return('Fee')
    allow(I18n).to receive(:t).with(i18n_name).and_return('Form name')
    allow(I18n).to receive(:t).with(i18n_date).and_return('Date received')
  end

  it { expect(helper).to be_a described_class }

  describe 'build_section_with_defaults' do
    let(:view) { instance_double(Views::Overview::Details, fee: '£310', all_fields: ['fee']) }

    context 'when called with minimal data' do
      it 'returns the correct html' 

    end
  end

  describe '#build_section' do

    context 'handles nil data fields' do
      let(:view) { instance_double(Views::Overview::Details, fee: '£310', form_name: '', date_received: nil) }

      context 'when requested fields all contain nil data' do
        it 'returns nothing' 

      end

      context 'when requested fields contain some data' do
        it 'returns only the populated field' 

      end
    end

    context 'when passed a name and an overview object' do
      let(:view) { instance_double(Views::Overview::Details, fee: '£310') }

      it 'returns the correct html' 


      context 'when link title and url is also passed' do
        let(:title) { 'TITLE' }
        let(:url) { 'URL' }

        it 'returns the correct html' 


        it 'returns the correct html with data attribute' 

      end

      context 'when passed a value starting with `W`' do
        let(:view) { instance_double(Views::Overview::Details, fee: 'WA123456A') }

        it 'returns the correct html' 

      end
    end
  end
end

