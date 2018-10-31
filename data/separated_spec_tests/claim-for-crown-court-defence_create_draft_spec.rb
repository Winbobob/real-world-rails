require 'rails_helper'

describe Claims::CreateDraft do

  after(:all) do
    clean_database
  end

  context 'draft claim creation' do
    let(:claim) { FactoryBot.build :advocate_claim }
    let(:validate) { true }

    subject { described_class.new(claim, validate: validate) }

    it 'defines the action' 


    it 'is a draft' 


    context 'successful draft creations' do
      context 'validation enabled' do
        let(:validate) { true }

        it 'forces validation if indicated' 

      end

      context 'validation not enabled' do
        let(:validate) { false }

        it 'forces validation if indicated' 

      end

      it 'is successful' 

    end

    context 'unsuccessful draft creations' do
      it 'is unsuccessful' 


      it 'is unsuccessful for an already submitted claim' 

    end
  end
end

