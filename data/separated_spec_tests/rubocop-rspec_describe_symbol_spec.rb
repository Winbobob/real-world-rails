RSpec.describe RuboCop::Cop::RSpec::DescribeSymbol do
  subject(:cop) { described_class.new }

  it 'flags violations for `describe :symbol`' 


  it 'flags violations for `describe :symbol` with multiple arguments' 


  it 'flags violations for `RSpec.describe :symbol`' 


  it 'flags violations for a nested `describe`' 


  it 'does not flag non-Symbol arguments' 


  it 'does not flag `context :symbol`' 

end

