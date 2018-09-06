require 'spec_helper'

describe Fabrication::Sequencer do

  context 'with no arguments' do
    subject { Fabrication::Sequencer.sequence }

    it { should == 0 }
    it 'creates a default sequencer' 

  end

  context 'with only a name' do

    it 'starts with 0' 


    it 'increments by one with each call' 


    it 'increments counters separately' 


  end

  context 'with a name and starting number' do

    it 'starts with the number provided' 


    it 'increments by one with each call' 


  end

  context 'with a block' do

    it 'yields the number to the block and returns the value' 


    it 'increments by one with each call' 


    context 'and then without a block' do
      it 'remembers the original block' 

      context 'and then with a new block' do
        it 'evaluates the new block' 

        it 'remembers the new block' 

      end
    end
  end
  context 'with two sequences declared with blocks' do
    it 'remembers both blocks' 

  end

  context "with a default sequence start" do
    before do
      Fabrication::Sequencer.reset
      Fabrication::Config.sequence_start = 10000
    end

    it "starts a new sequence at the default" 


    it "respects start value passed as an argument" 


    after do
      Fabrication::Sequencer.reset
    end
  end
end

