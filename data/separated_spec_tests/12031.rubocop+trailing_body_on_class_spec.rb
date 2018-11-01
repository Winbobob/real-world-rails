# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::TrailingBodyOnClass do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new('Layout/IndentationWidth' => { 'Width' => 2 })
  end

  it 'registers an offense when body trails after class definition' 


  it 'registers offense with multi-line class' 


  it 'accepts regular class' 


  it 'accepts class inheritance' 


  it 'auto-corrects body after class definition' 


  it 'auto-corrects with comment after body' 


  it 'auto-corrects when there are multiple semicolons' 


  context 'when class is not on first line of processed_source' do
    it 'auto-correct offense' 

  end
end

