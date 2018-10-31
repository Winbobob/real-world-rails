require 'spec_helper'

describe Gitlab::Ci::Variables::Collection::Item do
  let(:variable_key) { 'VAR' }
  let(:variable_value) { 'something' }
  let(:expected_value) { variable_value }

  let(:variable) do
    { key: variable_key, value: variable_value, public: true }
  end

  describe '.new' do
    context 'when unknown keyword is specified' do
      it 'raises error' 

    end

    context 'when required keywords are not specified' do
      it 'raises error' 

    end

    shared_examples 'creates variable' do
      subject { described_class.new(key: variable_key, value: variable_value) }

      it 'saves given value' 

    end

    shared_examples 'raises error for invalid type' do
      it do
        expect { described_class.new(key: variable_key, value: variable_value) }
          .to raise_error ArgumentError, /`value` must be of type String, while it was:/
      end
    end

    it_behaves_like 'creates variable'

    context "when it's nil" do
      let(:variable_value) { nil }
      let(:expected_value) { nil }

      it_behaves_like 'creates variable'
    end

    context "when it's an empty string" do
      let(:variable_value) { '' }
      let(:expected_value) { '' }

      it_behaves_like 'creates variable'
    end

    context 'when provided value is not a string' do
      [1, false, [], {}, Object.new].each do |val|
        context "when it's #{val}" do
          let(:variable_value) { val }

          it_behaves_like 'raises error for invalid type'
        end
      end
    end
  end

  describe '.fabricate' do
    it 'supports using a hash' 


    it 'supports using a hash with stringified values' 


    it 'supports using an active record resource' 


    it 'supports using another collection item' 

  end

  describe '#==' do
    it 'compares a hash representation of a variable' 

  end

  describe '#[]' do
    it 'behaves like a hash accessor' 

  end

  describe '#to_runner_variable' do
    context 'when variable is not a file-related' do
      it 'returns a runner-compatible hash representation' 

    end

    context 'when variable is file-related' do
      it 'appends file description component' 

    end
  end
end

