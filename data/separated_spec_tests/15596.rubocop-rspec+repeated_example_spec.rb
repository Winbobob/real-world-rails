# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::RepeatedExample do
  subject(:cop) { described_class.new }

  it 'registers an offense for repeated example' 
        it "does x" 


        it "does y" 

      end
    RUBY
  end

  it 'does not register a violation if rspec tag magic is involved' 
        it "does x" 


        it "does y", :focus do
          expect(foo).to be(bar)
        end
      end
    RUBY
  end

  it 'does not flag examples with different implementations' 
        it "does x" 


        it "does y" 

      end
    RUBY
  end

  it 'does not flag examples when different its arguments are used' 


  it 'does not flag repeated examples in different scopes' 
        it "does x" 


        context 'when the scope changes' do
          it 'does not flag anything' 

        end
      end
    RUBY
  end
end

