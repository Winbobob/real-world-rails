# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::CommentedKeyword do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'registers an offense when commenting on the same line as `end`' 


  it 'registers an offense when commenting on the same line as `begin`' 


  it 'registers an offense when commenting on the same line as `class`' 


  it 'registers an offense when commenting on the same line as `module`' 


  it 'registers an offense when commenting on the same line as `def`' 


  it 'registers an offense when commenting on indented keywords' 


  it 'registers an offense when commenting after keyword with spaces' 


  it 'registers an offense for one-line cases' 


  it 'does not register an offense if there are no comments after keywords' 


  it 'does not register an offense for certain comments' 


  it 'does not register an offense if AST contains # symbol' 


  it 'accepts keyword letter sequences that are not keywords' 

end

