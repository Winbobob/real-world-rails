require 'rails_helper'

RSpec.describe Jadu::Claim, type: :service do
  include_context 'block pdf generation'

  let(:api_double) { instance_double Jadu::API }
  let(:endpoint)   { ENV.fetch('JADU_API').to_s }
  let(:xml)        { instance_double JaduXml::ClaimPresenter, to_xml: xml_double }
  let(:xml_double) { instance_double('XML', :xml) }
  let(:claim)      { create :claim }

  let(:successful_api_response) do
    Jadu::API::ParsedResponse.new \
      instance_double('HTTParty::Response', code: 200, body: { 'feeGroupReference' => '1234567890' }.to_json)
  end

  let(:failure_api_response) do
    Jadu::API::ParsedResponse.new \
      instance_double('HTTParty::Response', code: 400, body: { 'errorCode' => '1', 'errorDescription' => 'herp', 'details' => 'derp' }.to_json)
  end

  let(:attachments) do
    { "et1_barrington_wrigglesworth.pdf" => claim.pdf_file.read,
      "file.rtf" => claim.claim_details_rtf_file.read,
      "file.csv" => claim.additional_claimants_csv_file.read }
  end

  before do
    claim.generate_pdf!
    allow(Jadu::API).to receive(:new).with(endpoint).and_return api_double
    allow(JaduXml::ClaimPresenter).to receive(:new).with(claim).and_return xml
  end

  describe '.create' do
    it 'submits a claim to Jadu' 


    it 'creates a log event' 


    context 'when the attachment filenames have non alphanumeric characters' do
      let(:claim) { create :claim, :non_sanitized_attachment_filenames }

      let(:attachments) do
        { "et1_barrington_wrigglesworth.pdf" => claim.pdf_file.read,
          "file_l_o_l_biz__v1_.rtf" => claim.claim_details_rtf_file.read,
          "file_l_o_l_biz__v1_.csv" => claim.additional_claimants_csv_file.read }
      end

      it 'converts the hyphens to underscores' 

    end

    describe 'on failure' do
      before do
        allow(api_double).to receive(:new_claim).
          with(xml_double, attachments).and_return failure_api_response
      end

      it 'raises an execption' 


      it 'creates a log event' 


      it 'does not update the claim' 


      it 'does not finalize the claim' 

    end

    describe 'on success' do
      before do
        allow(api_double).to receive(:new_claim).
          with(xml_double, attachments).and_return successful_api_response
      end

      it 'finalizes the claim' 


      describe 'when the API returns a fee group reference' do
        before do
          allow(successful_api_response).to receive(:[]).
            with('feeGroupReference').and_return 123456789000
        end

        it 'updates the claim fee group reference' 

      end

      describe 'when the API does not return a fee group reference' do
        it 'updates the claim fee group reference' 

      end
    end
  end
end

