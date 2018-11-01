# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::LeadingCommentSpace do
  subject(:cop) { described_class.new }

  it 'registers an offense for comment without leading space' 


  it 'does not register an offense for # followed by no text' 


  it 'does not register an offense for more than one space' 


  it 'does not register an offense for more than one #' 


  it 'does not register an offense for only #s' 


  it 'does not register an offense for #! on first line' 


  it 'registers an offense for #! after the first line' 


  context 'file named config.ru' do
    it 'does not register an offense for #\ on first line' 


    it 'registers an offense for #\ after the first line' 

  end

  context 'file not named config.ru' do
    it 'registers an offense for #\ on first line' 


    it 'registers an offense for #\ after the first line' 

  end

  it 'accepts rdoc syntax' 


  it 'accepts sprockets directives' 


  it 'auto-corrects missing space' 


  it 'accepts =begin/=end comments' 

end

