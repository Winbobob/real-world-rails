RSpec.describe RuboCop::Cop::RSpec::IteratedExpectation do
  subject(:cop) { described_class.new }

  it 'flags `each` with an expectation' 
      it 'validates users' 

    RUBY
  end

  it 'flags `each` when expectation calls method with arguments' 
      it 'validates users' 

    RUBY
  end

  it 'ignores `each` without expectation' 
      it 'validates users' 

    RUBY
  end

  it 'flags `each` with multiple expectations' 
      it 'validates users' 

    RUBY
  end

  it 'ignore `each` when the body does not contain only expectations' 
      it 'validates users' 

    RUBY
  end

  it 'ignores `each` with expectation on property' 
      it 'validates users' 

    RUBY
  end

  it 'ignores assignments in the iteration' 
      it 'validates users' 

    RUBY
  end

  it 'ignores `each` when there is a negative expectation' 
      it 'validates users' 

    RUBY
  end
end

