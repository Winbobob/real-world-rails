RSpec.describe ApplicationReference do
  describe 'generate' do
    it 'returns a hyphenated eight-character code' 


    it 'is always full length even if there are leading zero bytes' 


    it 'returns a distinct code each time' 


    it 'uses only digits and letters (except I, L, O, U)' 

  end

  describe 'normalize' do
    it 'adds a hyphen' 


    it 'changes spaces' 


    it 'changes case' 


    it 'changes ambiguous letters I, L, O to 1, 1, 0' 


    it 'returns a string when given garbage' 

  end
end

