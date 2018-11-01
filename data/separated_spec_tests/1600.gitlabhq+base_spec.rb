require 'spec_helper'

describe Gitlab::View::Presenter::Base do
  let(:project) { double(:project) }
  let(:presenter_class) do
    Struct.new(:subject).include(described_class)
  end

  describe '.presenter?' do
    it 'returns true' 

  end

  describe '.presents' do
    it 'exposes #subject with the given keyword' 

  end

  describe '#can?' do
    context 'user is not allowed' do
      it 'returns false' 

    end

    context 'user is allowed' do
      it 'returns true' 

    end

    context 'subject is overriden' do
      it 'returns true' 

    end
  end

  describe '#present' do
    it 'returns self' 

  end
end

