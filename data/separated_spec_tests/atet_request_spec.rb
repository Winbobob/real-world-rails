require 'rails_helper'

RSpec.describe PaymentGateway::Request, type: :service do
  let(:request) { instance_double 'ActionDispatch::Request', url: 'https://example.org/apply/pay' }
  let(:payment_gateway_request) { described_class.new request, reference: 'lol', amount: 250 }

  describe '#request_url' do
    context 'in test' do
      it 'returns the test request url' 

    end

    context 'in production' do
      before { allow(EPDQ).to receive(:test_mode).and_return false }

      it 'returns the production request url' 

    end
  end

  describe '#form_attributes' do
    before { allow(EPDQ).to receive(:sha_in).and_return 'lelelelelel' }

    let(:attributes) do
      {
        "SHASIGN" => "1CC44DE8F0565A0CE267A8EBBDF8122AA935CE5143F3E0976CC5B8490A119FF3",
        "CURRENCY" => "GBP",
        "LANGUAGE" => "en_US",
        "ACCEPTURL" => "https://example.org/apply/pay/success",
        "DECLINEURL" => "https://example.org/apply/pay/decline",
        "AMOUNT" => "250",
        "ORDERID" => "lol",
        "PSPID" => "ministry2",
        "TP" => "https://example.org/apply/barclaycard-payment-template"
      }
    end

    it 'returns an hash of form attributes needed to perform the request' 

  end
end

