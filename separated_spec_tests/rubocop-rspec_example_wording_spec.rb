RSpec.describe RuboCop::Cop::RSpec::ExampleWording, :config do
  subject(:cop) { described_class.new(config) }

  context 'with configuration' do
    let(:cop_config) do
      {
        'CustomTransform' => { 'have' => 'has' },
        'IgnoredWords'    => %w[only really]
      }
    end

    it 'ignores non-example blocks' 


    it 'finds description with `should` at the beginning' 
        it 'should do something' 

      RUBY
    end

    it 'finds description with `Should` at the beginning' 
        it 'Should do something' 

      RUBY
    end

    it 'finds description with `shouldn\'t` at the beginning' 
        it "shouldn't do something" 

      RUBY
    end

    it 'flags a lone should' 
        it 'should' 

      RUBY
    end

    it 'flags a lone should not' 
        it 'should not' 

      RUBY
    end

    it 'finds leading its' 
        it "it does something" 

      RUBY
    end

    it "skips words beginning with 'it'" 
        it 'itemizes items' 

      RUBY
    end

    it 'skips descriptions without `should` at the beginning' 
        it 'finds no should here' 

      RUBY
    end

    it 'skips descriptions starting with words that begin with `should`' 
        it 'shoulders the burden' 

      RUBY
    end

    include_examples 'autocorrect',
                     'it "should only have trait" do end',
                     'it "only has trait" do end'

    include_examples 'autocorrect',
                     'it "SHOULDN\'T only have trait" do end',
                     'it "DOES NOT only have trait" do end'

    include_examples 'autocorrect',
                     'it "it does something" do end',
                     'it "does something" do end'

    include_examples 'autocorrect',
                     'it "It does something" do end',
                     'it "does something" do end'

    include_examples 'autocorrect',
                     'it "should" do end',
                     'it "" do end'

    include_examples 'autocorrect',
                     'it "should not" do end',
                     'it "does not" do end'
  end

  context 'when configuration is empty' do
    include_examples 'autocorrect',
                     'it "should have trait" do end',
                     'it "haves trait" do end'

    include_examples 'autocorrect',
                     'it "should only fail" do end',
                     'it "onlies fail" do end'
  end
end

