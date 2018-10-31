# frozen_string_literal: true

require 'spec_helper'

shared_examples_for 'soft deletable' do
  let(:model) { described_class }

  describe '#deleted?' do
    it 'returns true if the deleted_at attribute is present' 


    it 'returns false if the deleted_at attribute is nil' 

  end

  describe '#destroy' do
    let!(:obj) { FactoryGirl.create(model.to_s.underscore.to_sym) }

    it 'sets the deleted_at attribute by default' 

    it 'actually destroys the object if :force is passed' 

    it 'returns the object if it has already been deleted' 


    context 'with associations' do
      let(:associated) { instance_spy(model) }

      before do
        allow(obj).to receive(:associated_records).and_return([associated])
      end

      it 'calls destroy on associated records' 

      it 'passes along the force parameter' 

    end
  end

  describe '#revive' do
    let!(:obj) { FactoryGirl.create(model.to_s.underscore.to_sym) }

    it 'unsets the deleted_at attribute by default' 

    it 'returns the object if it is not deleted' 


    context 'with associations' do
      let(:associated) { instance_spy(model) }

      before do
        allow(obj).to receive(:associated_records).and_return([associated])
      end

      it 'calls revive on associated records' 

    end
  end
end

