# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::TrailingBodyOnMethodDefinition do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new('Layout/IndentationWidth' => { 'Width' => 2 })
  end

  it 'registers an offense when body trails after method definition' 


  it 'registers when body starts on def line & continues one more line' 


  it 'registers when body starts on def line & continues many more lines' 


  it 'accepts a method with one line of body' 


  it 'accepts a method with multiple lines of body' 


  it 'does not register offense with trailing body on method end' 


  it 'auto-corrects body after method definition' 


  it 'auto-corrects with comment after body' 


  it 'auto-corrects body with method definition with args in parens' 


  it 'auto-corrects body with method definition with args not in parens' 


  it 'auto-correction removes semicolon from method definition but not body' 


  it 'auto-corrects when body continues on one more line' 


  it 'auto-corrects when body continues on multiple more line' 


  context 'when method is not on first line of processed_source' do
    it 'auto-corrects offense' 

  end
end

