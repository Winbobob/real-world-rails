require 'spec_helper'
require 'shared/options'

describe MultiJson do
  before(:all) do
    # make sure all available libs are required
    MultiJson::REQUIREMENT_MAP.each do |_, library|
      begin
        require library
      rescue ::LoadError
        next
      end
    end
  end

  context 'when no other json implementations are available' do
    around do |example|
      simulate_no_adapters { example.call }
    end

    it 'defaults to ok_json if no other json implementions are available' 


    it 'prints a warning' 

  end

  context 'caching' do
    before { MultiJson.use adapter }
    let(:adapter) { MultiJson::Adapters::JsonGem }
    let(:json_string) { '{"abc":"def"}' }

    it 'busts caches on global options change' 


    it 'busts caches on per-adapter options change' 

  end

  it 'defaults to the best available gem' 


  it 'looks for adapter even if @adapter variable is nil' 


  it 'is settable via a symbol' 


  it 'is settable via a case-insensitive string' 


  it 'is settable via a class' 


  it 'is settable via a module' 


  it 'throws AdapterError on bad input' 


  it 'gives access to original error when raising AdapterError' 


  context 'using one-shot parser' do
    before do
      expect(MultiJson::Adapters::JsonPure).to receive(:dump).once.and_return('dump_something')
      expect(MultiJson::Adapters::JsonPure).to receive(:load).once.and_return('load_something')
    end

    it 'should use the defined parser just for the call' 

  end

  it 'can set adapter for a block' 


  it 'JSON gem does not create symbols on parse' 


  unless jruby?
    it 'Oj does not create symbols on parse' 


    context 'with Oj.default_settings' do
      around do |example|
        options = Oj.default_options
        Oj.default_options = {:symbol_keys => true}
        MultiJson.with_engine(:oj) { example.call }
        Oj.default_options = options
      end

      it 'ignores global settings' 

    end
  end

  describe 'default options' do
    after(:all) { MultiJson.load_options = MultiJson.dump_options = nil }

    it 'is deprecated' 


    it 'sets both load and dump options' 

  end

  it_behaves_like 'has options', MultiJson

  describe 'aliases' do
    if jruby?
      describe 'jrjackson' do
        after { expect(MultiJson.adapter).to eq(MultiJson::Adapters::JrJackson) }

        it 'allows jrjackson alias as symbol' 


        it 'allows jrjackson alias as string' 

      end
    end
  end
end

