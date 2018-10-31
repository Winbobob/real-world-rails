require 'spec_helper'

describe Turnip::DSL do
  let(:context) { double.tap { |s| s.extend(Turnip::DSL) }}
  let(:an_object) { Object.new.tap { |o| o.extend(Turnip::Execute) }}
  describe '.steps_for' do
    before do
      ::RSpec.stub(:configure)
    end

    it 'creates a new module and adds steps to it' 


    it 'remembers the name of the module' 


    it 'tells RSpec to include the module' 


    it 'warns of deprecation when called with :global' 

  end

  describe '.step' do
    it 'adds steps to Turnip::Steps' 

  end

  describe '.placeholder' do
    before { Turnip::Placeholder.send(:placeholders).clear }

    it 'registers the placeholder globally' 


    it 'registers the multi placeholder globally' 

  end
end

