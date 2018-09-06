# frozen_string_literal: true

describe ContactRetraction do
  let(:contact) { FactoryGirl.build(:contact, sharing: true, receiving: true) }
  let(:retraction) { ContactRetraction.for(contact) }

  describe "#subscribers" do
    it "contains the contact person" 

  end

  describe "#data" do
    it "contains the hash with all data from the federation-retraction" 

  end

  describe ".retraction_data_for" do
    it "creates a retraction for a contact" 

  end

  describe ".for" do
    it "creates a retraction for a contact" 


    it "create contact entity with 'sharing' and 'following' set to false" 

  end

  describe ".defer_dispatch" do
    it "queues a job to send the retraction later" 

  end

  describe "#public?" do
    it "returns false for a contact retraction" 

  end
end

