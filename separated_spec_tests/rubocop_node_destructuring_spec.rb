# frozen_string_literal: true

RSpec.describe RuboCop::Cop::InternalAffairs::NodeDestructuring do
  subject(:cop) { described_class.new }

  context 'when destructuring using `node.children`' do
    it 'registers an offense when receiver is named `node`' 


    it 'registers an offense when receiver is named `send_node`' 

  end

  it 'does not register an offense for a predicate node type check' 


  it 'does not register an offense when receiver is named `array`' 

end

