# coding: utf-8

require 'rails_helper'

describe BusinessEntityService do
  subject { service }

  let!(:office) { create :office }
  let!(:jurisdiction) { office.jurisdictions[0] }
  let(:service) { described_class.new(office, jurisdiction) }

  describe 'when initialized with the correct variables' do
    it { is_expected.to be_a_kind_of described_class }
  end

  describe '#build_new' do
    subject(:built_new) { service.build_new(params) }

    let(:params) { { name: name, be_code: be_code, sop_code: sop_code } }

    describe 'when sent correct values' do
      let(:name) { 'test-jurisdiction' }
      let(:be_code) { nil }
      let(:sop_code) { '123456789' }

      it { is_expected.to be_a_kind_of BusinessEntity }

      it 'does not persist the object' 


      it 'returns a valid object' 

    end

    describe 'when sent incorrect values' do
      let(:name) { 'test-jurisdiction' }
      let(:be_code) { nil }
      let(:sop_code) { nil }

      it 'does not persist the object' 


      it 'returns an invalid object' 

    end
  end

  describe '#build_update' do
    subject(:build_update) { service.build_update(params) }

    let(:params) { { name: name, be_code: be_code, sop_code: sop_code } }
    let(:business_entity) { BusinessEntity.current_for(office, jurisdiction) }

    describe 'when sent new be_code' do
      let(:name) { 'test-jurisdiction' }
      let(:be_code) { business_entity.be_code.reverse }
      let(:sop_code) { business_entity.sop_code }

      it { is_expected.to be_a_kind_of BusinessEntity }

      it 'returns a new, non-persisted object' 


      it 'returns a valid object' 


      it 'has the ID of the existing business_entity' 

    end

    describe 'when sent new sop_code' do
      let(:name) { 'test-jurisdiction' }
      let(:be_code) { business_entity.be_code }
      let(:sop_code) { business_entity.sop_code.reverse }

      it { is_expected.to be_a_kind_of BusinessEntity }

      it 'returns a new, non-persisted object' 


      it 'returns a valid object' 


      it 'has no ID' 

    end

    describe 'when sent an updated name only' do
      let(:name) { 'test-jurisdiction' }
      let(:be_code) { business_entity.be_code }
      let(:sop_code) { business_entity.sop_code }

      it { is_expected.to be_a_kind_of BusinessEntity }

      it 'returns the existing persisted object' 


      it 'returns a valid object' 


      it 'has the ID of the existing business_entity' 

    end

    describe 'when sent incorrect values' do
      let(:name) { 'test-jurisdiction' }
      let(:be_code) { nil }
      let(:sop_code) { nil }

      it 'does not persist the object' 


      it 'returns an invalid object' 

    end
  end

  describe '#build_deactivate' do
    subject(:build_deactivate) { service.build_deactivate }

    it { is_expected.to be_a_kind_of BusinessEntity }

    it 'returns a persisted object' 


    it 'returns a valid object' 


    it 'has no valid_to' 

  end

  describe '#persist!' do
    subject(:persist) { service.persist! }

    let!(:business_entity) { BusinessEntity.current_for(office, jurisdiction) }

    context 'when persisting a new object' do
      before { service.build_new(name: 'Test', sop_code: '123456789') }

      it 'creates a new business_entity' 

    end

    context 'when persisting an update' do
      context 'that changes the code' do
        before { service.build_update(name: 'Test', sop_code: '987654321') }

        it 'creates a new business_entity' 


        it 'sets the valid_to date of the existing business_entity' 

      end

      context 'that does not change the code' do
        it 'creates a new business_entity' 

      end
    end

    context 'when persisting a deactivation' do
      before do
        service.build_deactivate
        service.persist!
        business_entity.reload
      end

      it 'sets the valid_to date of the existing business_entity' 


      it 'sets the current office and jurisdiction business_entity to nil' 

    end
  end
end

