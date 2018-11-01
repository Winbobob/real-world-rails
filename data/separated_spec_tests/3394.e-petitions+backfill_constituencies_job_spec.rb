require 'rails_helper'

RSpec.describe BackfillConstituenciesJob, type: :job do
  context "when the constituency_id column is nil" do
    let(:signature) { FactoryBot.create(:validated_signature, constituency_id: nil) }

    it "updates the constituency_id column" 

  end

  context "when the constituency_id column is not nil" do
    let(:signature) { FactoryBot.create(:validated_signature, constituency_id: "1234") }

    it "skips updating the constituency_id" 

  end

  context "when limited in scope by id" do
    let!(:signature_1) { FactoryBot.create(:validated_signature, constituency_id: nil) }
    let!(:signature_2) { FactoryBot.create(:validated_signature, constituency_id: nil) }

    it "updates those in scope" 


    it "doesn't update those out of scope" 

  end

  context "when limited in scope by date" do
    let!(:signature_1) { FactoryBot.create(:validated_signature, constituency_id: nil, validated_at: 2.weeks.ago) }
    let!(:signature_2) { FactoryBot.create(:validated_signature, constituency_id: nil, validated_at: 1.day.ago) }

    it "updates those in scope" 


    it "doesn't update those out of scope" 

  end

  context "when limited in scope by id and date" do
    let!(:signature_1) { FactoryBot.create(:validated_signature, constituency_id: nil, validated_at: 2.weeks.ago) }
    let!(:signature_2) { FactoryBot.create(:validated_signature, constituency_id: nil, validated_at: 1.day.ago) }
    let!(:signature_3) { FactoryBot.create(:validated_signature, constituency_id: nil, validated_at: 1.day.ago) }

    it "updates those in scope" 


    it "doesn't update those out of scope" 


    it "doesn't update those out of scope by date" 


    it "doesn't update those out of scope by id" 

  end
end

