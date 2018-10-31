RSpec.describe RuboCop::Cop::RSpec::VoidExpect do
  subject(:cop) { described_class.new }

  it 'registers offenses to void `expect`' 
      it 'something' 

    RUBY
  end

  it 'registers offenses to void `expect` when block has one expression' 
      it 'something' 

    RUBY
  end

  it 'registers offenses to void `expect` with block' 
      it 'something' 

    RUBY
  end

  it 'accepts non-void `expect`' 
      it 'something' 

    RUBY
  end

  it 'accepts non-void `expect` with block' 
      it 'something' 

    RUBY
  end
end

