require 'rails_helper'

describe OrganizationPresenter do
  let(:properties) do
    {
      id: 1,
      name: 'Parent Agency',
      description: 'Example description'
    }
  end

  subject(:presenter) { OrganizationPresenter.new(properties) }

  describe '#to_org' do
    context 'when the org is valid' do
      it 'initializes a new org' 

    end

    context 'when the org is not valid' do
      let(:properties) do
        {
          id: '1',
          description: 'Example description'
        }
      end

      it 'does not create a new org' 

    end

    context 'when the org already exists' do
      before do
        DatabaseCleaner.clean_with(:truncation)
        create(:organization)
      end

      it 'does not create a new org' 

    end

    context 'when the org has comma-separated field values' do
      let(:properties) do
        {
          id: '1',
          name: 'Example org',
          description: 'Example description',
          accreditations: 'one ,two',
          funding_sources: 'donations, grants ',
          licenses: ' license1, license2 '
        }
      end

      it 'transforms accreditations' 


      it 'transforms funding_sources' 


      it 'transforms licenses' 

    end

    context 'when the org has nil field values' do
      let(:properties) do
        {
          id: '1',
          name: 'Example org',
          description: 'Example description',
          accreditations: nil,
          funding_sources: nil,
          licenses: nil
        }
      end

      it 'set accreditations to empty array' 


      it 'set funding_sources to empty array' 


      it 'set licenses to empty array' 

    end
  end
end

