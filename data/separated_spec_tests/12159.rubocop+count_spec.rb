# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::Count do
  subject(:cop) { described_class.new }

  shared_examples 'selectors' do |selector|
    it "registers an offense for using array.#{selector}...size" 


    it "registers an offense for using hash.#{selector}...size" 


    it "registers an offense for using array.#{selector}...length" 


    it "registers an offense for using hash.#{selector}...length" 


    it "registers an offense for using array.#{selector}...count" 


    it "registers an offense for using hash.#{selector}...count" 


    it "allows usage of #{selector}...count with a block on an array" 


    it "allows usage of #{selector}...count with a block on a hash" 


    it "registers an offense for #{selector} with params instead of a block" 


    it "registers an offense for #{selector}(&:something).count" 


    it "registers an offense for #{selector}(&:something).count " \
       'when called as an instance method on its own class' do
      source = <<-RUBY.strip_indent
        class A < Array
          def count(&block)
            #{selector}(&block).count
          end
        end
      RUBY
      inspect_source(source)

      expect(cop.messages)
        .to eq(["Use `count` instead of `#{selector}...count`."])
      expect(cop.highlights).to eq(["#{selector}(&block).count"])
    end

    it "allows usage of #{selector} without getting the size" 


    context 'bang methods' do
      it "allows usage of #{selector}!...size" 


      it "allows usage of #{selector}!...count" 


      it "allows usage of #{selector}!...length" 

    end
  end

  it_behaves_like('selectors', 'select')
  it_behaves_like('selectors', 'reject')

  context 'ActiveRecord select' do
    it 'allows usage of select with a string' 


    it 'allows usage of select with multiple strings' 


    it 'allows usage of select with a symbol' 


    it 'allows usage of select with multiple symbols' 

  end

  it 'allows usage of another method with size' 


  it 'allows usage of size on an array' 


  it 'allows usage of count on an array' 


  it 'allows usage of count on an interstitial method called on select' 


  it 'allows usage of count on an interstitial method with blocks ' \
     'called on select' do
    expect_no_offenses(<<-RUBY.strip_indent)
      Data = Struct.new(:value)
      array = [Data.new(2), Data.new(3), Data.new(2)]
      array.select(&:value).uniq { |v| v > 2 }.count
    RUBY
  end

  it 'allows usage of size called on an assigned variable' 


  it 'allows usage of methods called on size' 


  context 'properly parses non related code' do
    it 'will not raise an error for Bundler.setup' 


    it 'will not raise an error for RakeTask.new' 

  end

  context 'autocorrect' do
    context 'will correct' do
      it 'select..size to count' 


      it 'select..count without a block to count' 


      it 'select..length to count' 


      it 'select...size when select has parameters' 

    end

    describe 'will not correct' do
      it 'reject...size' 


      it 'reject...count' 


      it 'reject...length' 


      it 'select...count when count has a block' 


      it 'reject...size when select has parameters' 

    end
  end

  context 'SafeMode true' do
    subject(:cop) { described_class.new(config) }

    let(:config) do
      RuboCop::Config.new(
        'Rails' => {
          'Enabled' => true
        },
        'Performance/Count' => {
          'SafeMode' => true
        }
      )
    end

    shared_examples 'selectors' do |selector|
      it "allows using array.#{selector}...size" 

    end

    it_behaves_like('selectors', 'select')
    it_behaves_like('selectors', 'reject')
  end
end

