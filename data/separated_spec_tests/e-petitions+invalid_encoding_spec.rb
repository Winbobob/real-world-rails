require 'rails_helper'

RSpec.describe "invalid encoding", type: :request do
  describe "when sponsoring a petition" do
    let(:petition) { FactoryBot.create(:validated_petition, sponsor_token: "foobar") }

    it "raises an ActiveRecord::RecordNotFound exception" 

  end

  describe "when validating a sponsor signature" do
    let(:petition) { FactoryBot.create(:validated_petition) }
    let(:signature) { FactoryBot.create(:pending_signature, sponsor: true, perishable_token: "foobar", petition: petition)}

    it "raises an ActiveRecord::RecordNotFound exception" 

  end

  describe "when validating a signature" do
    let(:petition) { FactoryBot.create(:open_petition) }
    let(:signature) { FactoryBot.create(:pending_signature, perishable_token: "foobar", petition: petition)}

    it "raises an ActiveRecord::RecordNotFound exception" 

  end

  describe "when unsubscribing a signature" do
    let(:petition) { FactoryBot.create(:open_petition) }
    let(:signature) { FactoryBot.create(:pending_signature, unsubscribe_token: "foobar", petition: petition)}

    it "raises an ActiveRecord::RecordNotFound exception" 

  end

  describe "when unsubscribing an archived signature" do
    let(:petition) { FactoryBot.create(:archived_petition) }
    let(:signature) { FactoryBot.create(:archived_signature, unsubscribe_token: "foobar", petition: petition)}

    it "raises an ActiveRecord::RecordNotFound exception" 

  end
end

