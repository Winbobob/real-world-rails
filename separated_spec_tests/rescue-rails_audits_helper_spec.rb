require 'rails_helper'

RSpec.describe AuditsHelper, type: :helper do
  describe "#classify_foreign_key" do
    let(:audit_type) { Dog }

    it "returns Breed class name" 


    it "returns User class name" 


    it "returns Shelter class name" 


    it "returns original value if no class is found" 


    it "returns original value of there is no _id at end of string" 


    it "works for special relationships" 

  end

  describe '#value_from_audit' do
    let(:user) { create(:user) }
    let(:frenchie) { create(:breed, name: 'Frenchie') }
    let(:shelter) { create(:shelter) }

    it 'returns Frenchie' 


    it 'returns Female' 


    it 'returns name of user' 


    it 'returns name of shelter' 

  end
end

