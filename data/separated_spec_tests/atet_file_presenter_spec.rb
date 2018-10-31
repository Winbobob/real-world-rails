require 'rails_helper'

RSpec.describe JaduXml::FilePresenter, type: :presenter do
  let(:jadu_xml_file_presenter) { described_class.new claim.claim_details_rtf }

  let(:claim) { create :claim }

  describe "decorated methods" do
    describe "#filename" do
      it "returns the name of the file" 


      context 'when the filename is hyphenated' do
        let(:claim) { create :claim, :non_sanitized_attachment_filenames }

        it 'replaces the hyphens with underscores' 

      end
    end

    describe "#checksum" do
      it "returns an md5 hexdigest of the file" 

    end
  end
end

