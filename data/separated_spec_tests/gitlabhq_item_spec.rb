require 'spec_helper'

describe Gitlab::Ci::Variables::Collection::Item do
  let(:variable) do
    { key: 'VAR', value: 'something', public: true }
  end

  describe '.new' do
    it 'raises error if unknown key i specified' 


    it 'raises error when required keywords are not specified' 

  end

  describe '.fabricate' do
    it 'supports using a hash' 


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

