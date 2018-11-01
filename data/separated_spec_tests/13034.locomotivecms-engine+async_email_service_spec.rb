require 'spec_helper'

describe Locomotive::Steam::AsyncEmailService do

  let(:page_finder)   { instance_double('PageFinder') }
  let(:liquid_parser) { instance_double('LiquidParser') }
  let(:asset_host)    { instance_double('AssetHost') }
  let(:simulation)    { false }
  let(:service)       { described_class.new(page_finder, liquid_parser, asset_host, simulation) }

  describe '#send_email!' do

    let(:options) { { to: 'john@doe.net', attachments: { 'foo.png' => 'Hello world' }, via: :smtp, via_options: { address: 'smtp.mydomain.org', authentication: :plain } } }

    subject { service.send_email!(options) }

    it 'creates a new job' 


    context 'no via options' do

      let(:options) { { to: 'john@doe.net' } }

      it 'creates a new job' 


    end

  end

end

