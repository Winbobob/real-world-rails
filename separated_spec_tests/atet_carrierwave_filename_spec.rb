require 'rails_helper'

RSpec.describe CarrierwaveFilename, type: :service do
  describe '.for' do
    let(:claimants_csv) { claim.additional_claimants_csv }

    context 'attachment exists' do
      let(:claim) { create :claim }

      it 'returns the filename including the extension' 


      context 'handling filenames with non alphanumeric characters' do
        let(:claim) { create :claim, :non_sanitized_attachment_filenames }

        context 'when underscore = true' do
          it 'returns the filename with underscores' 

        end

        context 'when underscore = false' do
          it 'returns the filename unchanged' 

        end
      end
    end

    context 'attachment does not exist' do
      let(:claim) { create :claim, :without_additional_claimants_csv }

      it 'returns nil' 

    end
  end
end

