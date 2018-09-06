# frozen_string_literal: true

RSpec.describe RuboCop::Cop::InternalAffairs::OffenseLocationKeyword do
  subject(:cop) { described_class.new }

  shared_examples 'auto-correction' do |name, old_source, new_source|
    it "auto-corrects #{name}" 

  end

  context 'when `node.loc.selector` is passed' do
    it 'registers an offense' 


    it 'registers an offense if message argument is passed' 

  end

  it 'does not register an offense when the `loc` is on a child node' 


  it 'does not register an offense when the `loc` is on a different node' 


  it_behaves_like(
    'auto-correction',
    'when there are no other kwargs but location',
    'add_offense(node, location: node.loc.selector)',
    'add_offense(node, location: :selector)'
  )

  it_behaves_like(
    'auto-correction',
    'when there are other kwargs',
    <<-RUBY,
      add_offense(
        node,
        message: 'foo',
        location: node.loc.selector,
        severity: :warning
      )
    RUBY
    <<-RUBY
      add_offense(
        node,
        message: 'foo',
        location: :selector,
        severity: :warning
      )
    RUBY
  )
end

