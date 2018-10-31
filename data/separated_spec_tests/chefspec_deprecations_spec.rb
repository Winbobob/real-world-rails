require 'spec_helper'

describe ChefSpec::Runner do
  before do
    allow_any_instance_of(ChefSpec::SoloRunner)
      .to receive(:dry_run?)
      .and_return(true)
    allow(ChefSpec::Runner).to receive(:deprecated)
  end

  describe '#define_runner_method' do
    before do
      allow(ChefSpec).to receive(:define_matcher)
    end

    it 'prints a deprecation' 


    it 'calls ChefSpec#define_matcher' 


  end

  describe '#new' do
    before do
      allow(ChefSpec::SoloRunner).to receive(:new)
    end

    it 'prints a deprecation' 


    it 'calls SoloRunner#new with no args' 


    it 'calls SoloRunner#new with args' 


  end
end

describe ChefSpec::Server do
  before do
    allow(ChefSpec::Server).to receive(:deprecated)
  end

  it 'prints a deprecation for any method called' 


  it 'raises non-conversion error for any method called' 


end

