# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::IndentAssignment, :config do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new('Layout/IndentAssignment' => {
                          'IndentationWidth' => cop_indent
                        },
                        'Layout/IndentationWidth' => { 'Width' => 2 })
  end
  let(:cop_indent) { nil } # use indentation with from Layout/IndentationWidth

  it 'registers an offense for incorrectly indented rhs' 


  it 'allows assignments that do not start on a newline' 


  it 'allows a properly indented rhs' 


  it 'allows a properly indented rhs with fullwidth characters' 


  it 'registers an offense for multi-lhs' 


  it 'ignores comparison operators' 


  it 'auto-corrects indentation' 


  context 'when indentation width is overridden for this cop only' do
    let(:cop_indent) { 7 }

    it 'allows a properly indented rhs' 


    it 'auto-corrects indentation' 

  end
end

