# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::CommentAnnotation, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    { 'Keywords' => %w[TODO FIXME OPTIMIZE HACK REVIEW] }
  end

  context 'missing colon' do
    it 'registers an offense' 


    it 'autocorrects' 

  end

  context 'with configured keyword' do
    let(:cop_config) { { 'Keywords' => %w[ISSUE] } }

    it 'registers an offense for a missing colon after the word' 


    it 'autocorrects a missing colon after keyword' 

  end

  context 'missing space after colon' do
    it 'registers an offense' 


    it 'autocorrects' 

  end

  context 'lower case keyword' do
    it 'registers an offense' 


    it 'autocorrects' 

  end

  context 'capitalized keyword' do
    it 'registers an offense' 


    it 'autocorrects' 

  end

  context 'upper case keyword with colon by no note' do
    it 'registers an offense' 


    it 'does not autocorrects' 

  end

  it 'accepts upper case keyword with colon, space and note' 


  it 'accepts upper case keyword alone' 


  it 'accepts a comment that is obviously a code example' 


  it 'accepts a keyword that is just the beginning of a sentence' 


  it 'accepts a keyword that is somewhere in a sentence' 


  context 'when a keyword is not in the configuration' do
    let(:cop_config) do
      { 'Keywords' => %w[FIXME OPTIMIZE HACK REVIEW] }
    end

    it 'accepts the word without colon' 

  end

  context 'offenses in consecutive inline comments' do
    it 'registers each of them' 

  end
end

