# frozen_string_literal: true

describe Export::UserSerializer do
  let(:user) { FactoryGirl.create(:user) }
  let(:serializer) { Export::UserSerializer.new(user.id, root: false) }

  it "has basic user's attributes" 


  it "uses FederationEntitySerializer to serialize user profile" 


  it "uses AspectSerializer for array serializing contact_groups" 


  it "uses ContactSerializer for array serializing contacts" 


  it "uses OwnPostSerializer for array serializing posts" 


  it "serializes followed tags" 


  it "uses OwnRelayablesSerializer for array serializing relayables" 


  it "serializes post subscriptions" 

end

