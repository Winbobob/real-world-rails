# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::TrailingMethodEndStatement do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new('Layout/IndentationWidth' => { 'Width' => 2 })
  end

  it 'register offense with trailing end on 2 line method' 


  it 'register offense with trailing end on 3 line method' 


  it 'register offense with trailing end on method with comment' 


  it 'register offense with trailing end on method with block' 


  it 'register offense with trailing end inside class' 


  it 'does not register on single line no op' 


  it 'does not register on single line method' 


  it 'auto-corrects trailing end in 2 line method' 


  it 'auto-corrects trailing end in 3 line method' 


  it 'auto-corrects trailing end with comment' 


  it 'auto-corrects trailing end on method with block' 


  it 'auto-corrects trailing end for larger example' 

end

