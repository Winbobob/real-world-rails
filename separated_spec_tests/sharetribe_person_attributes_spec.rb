require "spec_helper"

describe AnalyticService::PersonAttributes do
  let(:community) { FactoryGirl.create(:community) }
  let(:person) do
    person = FactoryGirl.create(:person, community: community)
    FactoryGirl.create(:community_membership, community: community, person: person, admin: true)
    person
  end

  context "#attributes" do
    it 'not configured community, person' 


    it 'admin created filter' 


    it 'admin created listing' 


    it 'admin invited user' 


    it 'admin configured facebook connect' 


    it 'admin configured outgoing email' 


    it 'order type online payment' 


    it 'order type online payment' 


    it 'admin configured paypal acount and fees' 


    it 'admin configured stripe api and fees' 


    it 'payment providers available' 


    it 'admin deleted marketplace' 

  end
end


