RSpec.describe RuboCop::Cop::RSpec::HooksBeforeExamples do
  subject(:cop) { described_class.new }

  it 'flags `before` after `it`' 


  it 'flags `before` after `context`' 


  it 'flags `before` after `include_examples`' 


  it 'flags `after` after an example' 


  it 'flags scoped hook after an example' 


  it 'does not flag hooks before the examples' 


  it 'does not flag `before` in a nested context' 


  it 'allows inclusion of context before hooks' 


  it 'ignores single-line example blocks' 


  bad_code = <<-RUBY
    RSpec.describe User do
      include_examples('should be after hook')
      context 'another one' do
        before { another_setup }
        include_examples('should be ok')
      end

      after { cleanup }
    end
  RUBY

  good_code = <<-RUBY
    RSpec.describe User do
      after { cleanup }
      include_examples('should be after hook')
      context 'another one' do
        before { another_setup }
        include_examples('should be ok')
      end

    end
  RUBY

  include_examples 'autocorrect', bad_code, good_code
end

