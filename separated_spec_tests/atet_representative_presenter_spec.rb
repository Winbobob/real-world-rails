require 'rails_helper'

RSpec.describe JaduXml::RepresentativePresenter, type: :presenter do
  let(:jadu_xml_representative_presenter) { described_class.new representative }

  let(:representative) { create :representative }

  describe 'decorated methods' do
    describe '#claimant_or_respondent' do
      it 'returns C' 

    end

    describe '#type' do
      it 'converts the type using a represnetative type mapper' 


      it { expect(jadu_xml_representative_presenter.type).to eq 'Law Centre' }
    end
  end
end

