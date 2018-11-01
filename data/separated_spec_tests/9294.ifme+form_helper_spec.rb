# frozen_string_literal: true

describe FormHelper do
  let(:inputs) { nil }
  let(:action) { nil }
  let(:valid_inputs) do
    [
      { id: 'some-id', type: 'text', value: 'Hello' },
      { id: 'some-other-id', type: 'number', value: 1 }
    ]
  end
  let(:valid_action) { '/categories' }

  describe '#edit_form_props' do
    subject { edit_form_props(inputs, action) }

    context 'has invalid arguments' do
      it 'returns nil' 

    end

    context 'has valid arguments' do
      let(:inputs) { valid_inputs }
      let(:action) { valid_action }
      it 'returns correct props' 

    end
  end

  describe '#new_form_props' do
    subject { new_form_props(inputs, action) }

    context 'has invalid arguments' do
      it 'returns nil' 

    end

    context 'has valid arguments' do
      let(:inputs) { valid_inputs }
      let(:action) { valid_action }
      it 'returns correct props' 

    end
  end

  describe '#quick_create_form_props' do
    subject { quick_create_form_props(inputs, action) }

    context 'has invalid arguments' do
      it 'returns nil' 

    end

    context 'has valid arguments' do
      let(:inputs) { valid_inputs }
      let(:action) { valid_action }
      it 'returns correct props' 

    end
  end
end

