# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::EmptyLineAfterFinalLet do
  subject(:cop) { described_class.new }

  it 'checks for empty line after last let' 


  it 'check for empty line after the last `let!`' 


  it 'approves empty line after let' 


  it 'allows comment followed by an empty line after let' 


  it 'flags missing empty line after the comment that comes after last let' 


  it 'ignores empty lines between the lets' 


  it 'handles let in tests' 
        it "doesn't mind me calling a method called let in the test" 

      end
    RUBY
  end

  it 'handles multiline let block' 


  it 'handles let being the latest node' 


  it 'handles HEREDOC for let' 
        it 'uses heredoc' 

      end
    RUBY
  end

  it 'handles silly HEREDOC syntax for let' 
        it 'has tricky syntax' 

      end
    RUBY
  end

  bad_example = <<-RUBY
  RSpec.describe User do
    let(:params) { foo }
    it 'has a new line' 

  end
  RUBY

  good_example = <<-RUBY
  RSpec.describe User do
    let(:params) { foo }

    it 'has a new line' 

  end
  RUBY

  include_examples 'autocorrect',
                   bad_example,
                   good_example

  bad_example = <<-RUBY
  RSpec.describe User do
    let(:params) { foo }
    # a multiline comment marking
    # the end of setup
    it 'has a new line' 

  end
  RUBY

  good_example = <<-RUBY
  RSpec.describe User do
    let(:params) { foo }
    # a multiline comment marking
    # the end of setup

    it 'has a new line' 

  end
  RUBY

  include_examples 'autocorrect',
                   bad_example,
                   good_example
end

