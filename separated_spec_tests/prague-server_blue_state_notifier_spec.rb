require 'spec_helper'

describe BlueStateNotifier do
  let(:customer) { create(:customer) }
  let(:organization) { create(:organization) }
  let!(:crm) { create(:crm, platform: 'bluestate', organization: organization) }
  let(:charge) { create(:charge, customer: customer, organization: organization) }

  before :each do
    mock_connection = double()
    allow(mock_connection).to receive(:perform_request).and_return('{"summary": {"missing_ids": 0, "failures": 0}}')
    allow(BlueStateDigital::Connection).to receive(:new).and_return(mock_connection)
  end

  it 'should push the contribution into BSD' 


  it 'should convert amounts into the default currency for the CRM' 


  it "should push all tags as sources into BSD" 

end

