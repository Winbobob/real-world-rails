# frozen_string_literal: true

RSpec.describe RuboCop::Cop::InternalAffairs::OffenseLocationKeyword do
  subject(:cop) { described_class.new }

  context 'when `node.loc.selector` is passed' do
    it 'registers an offense' 


    it 'registers an offense if message argument is passed' 

  end

  it 'does not register an offense when the `loc` is on a child node' 


  it 'does not register an offense when the `loc` is on a different node' 


  it 'auto-corrects `location` when it is the only keyword' 


  it 'auto-corrects `location` when there are other keywords' 

end

