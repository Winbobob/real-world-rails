# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::AlignHash, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    {
      'EnforcedHashRocketStyle' => 'key',
      'EnforcedColonStyle' => 'key'
    }
  end

  shared_examples 'not on separate lines' do
    it 'accepts single line hash' 


    it 'accepts several pairs per line' 


    it "does not auto-correct pairs that don't start a line" 

  end

  context 'always inspect last argument hash' do
    let(:cop_config) do
      {
        'EnforcedLastArgumentHashStyle' => 'always_inspect'
      }
    end

    it 'registers offense for misaligned keys in implicit hash' 


    it 'registers offense for misaligned keys in explicit hash' 

  end

  context 'always ignore last argument hash' do
    let(:cop_config) do
      {
        'EnforcedLastArgumentHashStyle' => 'always_ignore'
      }
    end

    it 'accepts misaligned keys in implicit hash' 


    it 'accepts misaligned keys in explicit hash' 

  end

  context 'ignore implicit last argument hash' do
    let(:cop_config) do
      {
        'EnforcedLastArgumentHashStyle' => 'ignore_implicit'
      }
    end

    it 'accepts misaligned keys in implicit hash' 


    it 'registers offense for misaligned keys in explicit hash' 

  end

  context 'ignore explicit last argument hash' do
    let(:cop_config) do
      {
        'EnforcedLastArgumentHashStyle' => 'ignore_explicit'
      }
    end

    it 'registers offense for misaligned keys in implicit hash' 


    it 'accepts misaligned keys in explicit hash' 

  end

  context 'with default configuration' do
    it 'registers an offense for misaligned hash keys' 


    it 'registers an offense for misaligned mixed multiline hash keys' 


    it 'accepts aligned hash keys' 


    it 'registers an offense for separator alignment' 


    context 'with implicit hash as last argument' do
      it 'registers an offense for misaligned hash keys' 


      it 'registers an offense for right alignment of keys' 


      it 'accepts aligned hash keys' 


      it 'accepts an empty hash' 

    end

    it 'auto-corrects alignment' 


    it 'auto-corrects alignment for mixed multiline hash keys' 


    it 'auto-corrects alignment when using double splat ' \
       'in an explicit hash' do
      new_source = autocorrect_source(<<-RUBY.strip_indent)
        Hash(foo: 'bar',
               **extra_params
        )
      RUBY

      expect(new_source).to eq(<<-RUBY.strip_indent)
        Hash(foo: 'bar',
             **extra_params
        )
      RUBY
    end

    it 'auto-corrects alignment when using double splat in braces' 

  end

  include_examples 'not on separate lines'

  context 'with table alignment configuration' do
    let(:cop_config) do
      {
        'EnforcedHashRocketStyle' => 'table',
        'EnforcedColonStyle' => 'table'
      }
    end

    include_examples 'not on separate lines'

    it 'accepts aligned hash keys and values' 


    it 'accepts an empty hash' 


    it 'accepts a multiline array of single line hashes' 


    it 'accepts hashes that use different separators' 


    it 'accepts hashes that use different separators and double splats' 


    it 'accepts a symbol only hash followed by a keyword splat' 


    it 'accepts a keyword splat only hash' 


    it 'registers an offense for misaligned hash values' 


    it 'registers an offense for misaligned hash keys' 


    it 'registers an offense for misaligned hash rockets' 


    it 'auto-corrects alignment' 

  end

  context 'with table+separator alignment configuration' do
    let(:cop_config) do
      {
        'EnforcedHashRocketStyle' => 'table',
        'EnforcedColonStyle' => 'separator'
      }
    end

    it 'accepts a single method argument entry with colon' 

  end

  context 'with invalid configuration' do
    let(:cop_config) do
      {
        'EnforcedHashRocketStyle' => 'junk',
        'EnforcedColonStyle' => 'junk'
      }
    end

    it 'fails' 

  end

  context 'with separator alignment configuration' do
    let(:cop_config) do
      {
        'EnforcedHashRocketStyle' => 'separator',
        'EnforcedColonStyle' => 'separator'
      }
    end

    it 'accepts aligned hash keys' 


    it 'accepts an empty hash' 


    it 'registers an offense for misaligned hash values' 


    it 'registers an offense for misaligned hash rockets' 


    it 'accepts hashes with different separators' 


    include_examples 'not on separate lines'

    it 'auto-corrects alignment' 


    it "doesn't break code by moving long keys too far left" 

  end

  context 'with different settings for => and :' do
    let(:cop_config) do
      {
        'EnforcedHashRocketStyle' => 'key',
        'EnforcedColonStyle' => 'separator'
      }
    end

    it 'registers offenses for misaligned entries' 


    it 'accepts aligned entries' 

  end
end

