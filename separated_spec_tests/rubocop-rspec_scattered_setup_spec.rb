RSpec.describe RuboCop::Cop::RSpec::ScatteredSetup do
  subject(:cop) { described_class.new }

  it 'flags multiple hooks in the same example group' 


  it 'flags multiple hooks of the same scope with different symbols' 


  it 'flags multiple before(:all) hooks in the same example group' 


  it 'does not flag different hooks' 


  it 'does not flag different hook types' 


  it 'does not flag hooks in different example groups' 


  it 'does not flag hooks in different shared contexts' 


  it 'does not flag similar method names inside of examples' 
        it 'uses an instance method called before' 

      end
    RUBY
  end
end

