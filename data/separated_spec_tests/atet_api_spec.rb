require 'rails_helper'

RSpec.describe Jadu::API do
  let(:jadu_api) { described_class.new(base_url, ssl_version: :TLSv1) }
  let(:base_url) { 'https://example.com/api/1/' }
  let(:response) { instance_double('HTTParty::Response') }
  let(:parsed_response) { instance_double('Jadu::API::ParsedResponse') }

  context 'ETOffice' do
    let(:eto) { instance_double('ETOffice') }
    let(:uri) { URI.parse('https://example.com/api/1/fgr-et-office') }
    let(:postcode) { 'SW1A 1AA' }

    it 'constructs an ET Office request' 


    it 'sends an ET Office request' 


    it 'parses an ETOffice' 


    it 'returned parsed ETOffice response' 

  end

  context 'New Claim' do
    let(:claim) { instance_double('NewClaim') }
    let(:uri) { URI.parse('https://example.com/api/1/new-claim') }
    let(:xml) { '<xml />' }

    it 'constructs and sends a New Claim request and parses the response' 


    it 'constructs New Claim' 


    it 'sends a New Claim request' 


    it 'parses the response' 

  end
end

