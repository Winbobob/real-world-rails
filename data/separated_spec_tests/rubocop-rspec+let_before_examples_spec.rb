RSpec.describe RuboCop::Cop::RSpec::LetBeforeExamples do
  subject(:cop) { described_class.new }

  it 'flags `let` after `it`' 


  it 'flags `let` after `context`' 


  it 'flags `let` after `include_examples`' 


  it 'does not flag `let` before the examples' 


  it 'does not flag `let` in a nested context' 


  it 'allows inclusion of context before `let`' 


  it 'ignores single-line example blocks' 


  bad_code = <<-RUBY
    RSpec.describe User do
      include_examples('should be after let')
      context 'another one' do
        let(:foo) { baz }
        include_examples('should be ok')
      end

      let(:foo) { bar }
    end
  RUBY

  good_code = <<-RUBY
    RSpec.describe User do
      let(:foo) { bar }
      include_examples('should be after let')
      context 'another one' do
        let(:foo) { baz }
        include_examples('should be ok')
      end

    end
  RUBY

  include_examples 'autocorrect', bad_code, good_code

  bad_code = <<-RUBY
    RSpec.describe User do
      include_examples('should be after let')

      let(:foo) { (<<-SOURCE) }
      some long text here
      SOURCE
    end
  RUBY

  good_code = <<-RUBY
    RSpec.describe User do
      let(:foo) { (<<-SOURCE) }
      some long text here
      SOURCE
      include_examples('should be after let')

    end
  RUBY

  include_examples 'autocorrect', bad_code, good_code
end

