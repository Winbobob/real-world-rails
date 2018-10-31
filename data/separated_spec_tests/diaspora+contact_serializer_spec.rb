# frozen_string_literal: true

describe Export::ContactSerializer do
  let(:contact) { FactoryGirl.create(:contact) }
  let(:serializer) { Export::ContactSerializer.new(contact) }
  let(:aspect) { FactoryGirl.create(:aspect) }

  it "has contact attributes" 


  it "serializes aspects membership" 

end

