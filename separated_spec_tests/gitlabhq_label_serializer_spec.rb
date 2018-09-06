require 'spec_helper'

describe LabelSerializer do
  let(:user) { create(:user) }

  let(:serializer) do
    described_class.new(user: user)
  end

  subject { serializer.represent(resource) }

  describe '#represent' do
    context 'when a single object is being serialized' do
      let(:resource) { create(:label) }

      it 'serializes the label object' 

    end

    context 'when multiple objects are being serialized' do
      let(:num_labels) { 2 }
      let(:resource) { create_list(:label, num_labels) }

      it 'serializes the array of labels' 

    end
  end

  describe '#represent_appearance' do
    context 'when represents only appearance' do
      let(:resource) { create(:label) }

      subject { serializer.represent_appearance(resource) }

      it 'serializes only attributes used for appearance' 

    end
  end
end

