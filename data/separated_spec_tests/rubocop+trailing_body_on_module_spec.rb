# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::TrailingBodyOnModule do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new('Layout/IndentationWidth' => { 'Width' => 2 })
  end

  it 'registers an offense when body trails after module definition' 


  it 'registers offense with multi-line module' 


  it 'registers offense when module definition uses semicolon' 


  it 'accepts regular module' 


  it 'auto-corrects body after module definition' 


  it 'auto-corrects with comment after body' 


  it 'auto-corrects when there are multiple semicolons' 


  context 'when module is not on first line of processed_source' do
    it 'auto-correct offense' 

  end
end

