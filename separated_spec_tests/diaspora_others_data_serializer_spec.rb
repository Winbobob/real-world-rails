# frozen_string_literal: true

describe Export::OthersDataSerializer do
  let(:user) { FactoryGirl.create(:user) }
  let(:serializer) { Export::OthersDataSerializer.new(user.id) }

  it "uses FederationEntitySerializer for array serializing relayables" 


  context "with user's activity" do
    before do
      DataGenerator.new(user).activity
    end
  end
end

