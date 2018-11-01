require 'spec_helper'

describe LicenseTemplateFinder do
  describe '#execute' do
    subject(:result) { described_class.new(nil, params).execute }

    let(:categories) { categorised_licenses.keys }
    let(:categorised_licenses) { result.group_by(&:category) }

    context 'popular: true' do
      let(:params) { { popular: true } }

      it 'only returns popular licenses' 

    end

    context 'popular: false' do
      let(:params) { { popular: false } }

      it 'only returns unpopular licenses' 

    end

    context 'popular: nil' do
      let(:params) { { popular: nil } }

      it 'returns all licenses known by the Licensee gem' 


      it 'correctly copies all attributes' 

    end
  end
end

