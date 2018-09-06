require 'spec_helper'

describe Listen::Adapter do
  subject { described_class.new('dir') }

  describe '#initialize' do
    it 'sets the latency to the default one' 


    it 'accepts a single directory to watch' 


    it 'accepts multiple directories to watch' 

  end

  describe ".select_and_initialize" do
    before do
      Listen::Adapter::OPTIMIZED_ADAPTERS.each do |adapter|
        Listen::Adapters.const_get(adapter).stub(:usable_and_works?) { false }
      end
    end

    context "with force_adapter option" do
      it "returns an instance of the given adapter class" 

    end

    context "with no specific adapter usable" do
      it "returns Listen::Adapters::Polling instance" 


      it 'warns with the default polling fallback message' 


      context "with custom polling_fallback_message option" do
        it "warns with the custom polling fallback message" 

      end

      context "with polling_fallback_message to false" do
        it "doesn't warn with a polling fallback message" 

      end
    end

    Listen::Adapter::OPTIMIZED_ADAPTERS.each do |adapter|
      adapter_class = Listen::Adapters.const_get(adapter)

      context "on #{adapter}" do
        before { adapter_class.stub(:usable_and_works?) { true } }

        it "uses Listen::Adapters::#{adapter}" 


        context 'when the use of the polling adapter is forced' do
          it 'uses Listen::Adapters::Polling' 

        end
      end
    end
  end

  describe '.load_dependend_adapter' do
    after(:each) { described_class.instance_variable_set('@loaded', nil) }

    it 'returns true (success) even if the adapter_gem has already been required' 


    it 'returns false (failure) if the adapter_gem cannot be required' 

  end

  Listen::Adapter::OPTIMIZED_ADAPTERS.each do |adapter|
    adapter_class = Listen::Adapters.const_get(adapter)
    if adapter_class.usable?
      describe '.usable_and_works?' do
        it 'checks if the adapter is usable' 


        context 'with one directory' do
          it 'tests if that directory actually work' 

        end

        context 'with multiple directories' do
          it 'tests if each directory passed does actually work' 

        end
      end

      describe '.works?' do
        it 'does work' 

      end
    end
  end
end

