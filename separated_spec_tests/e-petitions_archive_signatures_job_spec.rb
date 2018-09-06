require 'rails_helper'

RSpec.describe ArchiveSignaturesJob, type: :job do
  let(:petition) { FactoryBot.create(:validated_petition, sponsors_signed: true) }
  let(:archived_petition) { FactoryBot.create(:archived_petition, id: petition.id) }
  let(:archived_signature) { archived_petition.signatures.last }

  it "copies every signature" 


  it "marks every signature as archived" 


  it "schedules a new job if it doesn't finish archiving" 


  it "marks the petition as archived if it finishes archiving" 


  context "with the creator signature" do
    let(:signature) { archived_petition.signatures.first }

    before do
      described_class.perform_now(petition, archived_petition)
    end

    it "assigns the creator attribute" 

  end

  context "with a sponsor signature" do
    let(:signature) { archived_petition.signatures.second }

    before do
      described_class.perform_now(petition, archived_petition)
    end

    it "assigns the sponsor attribute" 

  end

  shared_examples_for "a copied signature" do
    it "copies the attributes of the signature" 


    it "is persisted" 

  end

  context "with a pending signature" do
    let!(:signature) { FactoryBot.create(:pending_signature, petition: petition) }

    before do
      described_class.perform_now(petition, archived_petition)
    end

    it_behaves_like "a copied signature"
  end

  context "with a validated signature" do
    let!(:signature) { FactoryBot.create(:validated_signature, petition: petition, number: 7) }

    before do
      described_class.perform_now(petition, archived_petition)
    end

    it_behaves_like "a copied signature"

    it "copies the validated_at timestamp" 

  end

  context "with an invalidated signature" do
    let!(:invalidation) { FactoryBot.create(:invalidation, name: "Jo Public") }
    let!(:signature) { FactoryBot.create(:invalidated_signature, petition: petition, invalidation: invalidation) }

    before do
      described_class.perform_now(petition, archived_petition)
    end

    it_behaves_like "a copied signature"

    it "copies the invalidation assocation" 


    it "copies the invalidated_at timestamp" 

  end

  context "with a fradulent signature" do
    let!(:signature) { FactoryBot.create(:fraudulent_signature, petition: petition) }

    before do
      described_class.perform_now(petition, archived_petition)
    end

    it_behaves_like "a copied signature"
  end

  context "with a signature that has been notified about a government response" do
    let!(:signature) { FactoryBot.create(:validated_signature, petition: petition, government_response_email_at: 4.weeks.ago) }

    before do
      described_class.perform_now(petition, archived_petition)
    end

    it_behaves_like "a copied signature"

    it "copies the government_response_email_at timestamp" 

  end

  context "with a signature that has been notified about a scheduled debate" do
    let!(:signature) { FactoryBot.create(:validated_signature, petition: petition, debate_scheduled_email_at: 4.weeks.ago) }

    before do
      described_class.perform_now(petition, archived_petition)
    end

    it_behaves_like "a copied signature"

    it "copies the debate_scheduled_email_at timestamp" 

  end

  context "with a signature that has been notified about a debate outcome" do
    let!(:signature) { FactoryBot.create(:validated_signature, petition: petition, debate_outcome_email_at: 4.weeks.ago) }

    before do
      described_class.perform_now(petition, archived_petition)
    end

    it_behaves_like "a copied signature"

    it "copies the debate_outcome_email_at timestamp" 

  end

  context "with a signature that has been notified about a other business" do
    let!(:signature) { FactoryBot.create(:validated_signature, petition: petition, petition_email_at: 4.weeks.ago) }

    before do
      described_class.perform_now(petition, archived_petition)
    end

    it_behaves_like "a copied signature"

    it "copies the petition_email_at timestamp" 

  end

  context "with a signature that has invalid attributes" do
    let!(:signature) { FactoryBot.create(:validated_signature, petition: petition) }

    before do
      signature.update_column(:location_code, nil)
      signature.reload

      described_class.perform_now(petition, archived_petition)
    end

    it_behaves_like "a copied signature"

    it "the original signature is invalid" 


    it "the archived signature is invalid" 

  end
end

