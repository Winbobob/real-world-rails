require 'spec_helper'

describe ChefSpec::Matchers::StateAttrsMatcher do
  subject { described_class.new([:a, :b]) }

  context 'when the resource does not exist' do
    let(:resource) { nil }
    before { subject.matches?(resource) }

    it 'does not match' 


    it 'has the correct description' 


    it 'has the correct failure message for should' 


    it 'has the correct failure message for should not' 

  end

  context 'when the resource exists' do
    let(:klass) { double('class', state_attrs: [:a, :b]) }
    let(:resource) { double('resource', class: klass) }
    before { subject.matches?(resource) }

    it 'has the correct description' 


    it 'has the correct failure message for should' 


    it 'has the correct failure message for should not' 


    it 'matches when the state attributes are correct' 


    it 'does not match when the state attributes are incorrect' 


    it 'does not match when partial state attribute are incorrect' 

  end
end

