require 'spec_helper'

describe CalculateOrganizationTotalsWorker do
  let(:organization) { build_stubbed(:organization) }

  before :each do
    expect(Organization).to receive(:find).with(organization.id).and_return(organization)
  end

  it 'should reset redis data for tags and namespaces' 


  it 'should aggregate paid charges for all tags' 

end

