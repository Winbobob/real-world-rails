require 'spec_helper'

describe Gitlab::Ci::Config::Entry::Simplifiable do
  describe '.strategy' do
    let(:entry) do
      Class.new(described_class) do
        strategy :Something, if: -> { 'condition' }
        strategy :DifferentOne, if: -> { 'condition' }
      end
    end

    it 'defines entry strategies' 

  end

  describe 'setting strategy by a condition' do
    let(:first) { double('first strategy') }
    let(:second) { double('second strategy') }
    let(:unknown) { double('unknown strategy') }

    before do
      stub_const("#{described_class.name}::Something", first)
      stub_const("#{described_class.name}::DifferentOne", second)
      stub_const("#{described_class.name}::UnknownStrategy", unknown)
    end

    context 'when first strategy should be used' do
      let(:entry) do
        Class.new(described_class) do
          strategy :Something, if: -> (arg) { arg == 'something' }
          strategy :DifferentOne, if: -> (*) { false }
        end
      end

      it 'attemps to load a first strategy' 

    end

    context 'when second strategy should be used' do
      let(:entry) do
        Class.new(described_class) do
          strategy :Something, if: -> (arg) { arg == 'something' }
          strategy :DifferentOne, if: -> (arg) { arg == 'test' }
        end
      end

      it 'attemps to load a second strategy' 

    end

    context 'when neither one is a valid strategy' do
      let(:entry) do
        Class.new(described_class) do
          strategy :Something, if: -> (*) { false }
          strategy :DifferentOne, if: -> (*) { false }
        end
      end

      it 'instantiates an unknown strategy' 

    end
  end

  context 'when a unknown strategy class is not defined' do
    let(:entry) do
      Class.new(described_class) do
        strategy :String, if: -> (*) { true }
      end
    end

    it 'raises an error when being initialized' 

  end
end

