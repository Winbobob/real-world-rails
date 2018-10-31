# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::CommentIndentation do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config
      .new('Layout/IndentationWidth' => { 'Width' => indentation_width })
  end
  let(:indentation_width) { 2 }

  context 'on outer level' do
    it 'accepts a correctly indented comment' 


    it 'accepts a comment that follows code' 


    it 'accepts a documentation comment' 


    it 'registers an offense for an incorrectly indented (1) comment' 


    it 'registers an offense for an incorrectly indented (2) comment' 


    it 'registers an offense for each incorrectly indented comment' 

  end

  it 'registers offenses before __RUBY__ but not after' 


  context 'around program structure keywords' do
    it 'accepts correctly indented comments' 


    context 'with a blank line following the comment' do
      it 'accepts a correctly indented comment' 

    end
  end

  context 'near various kinds of brackets' do
    it 'accepts correctly indented comments' 


    it 'is unaffected by closing bracket that does not begin a line' 

  end

  it 'auto-corrects' 

end

