# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::RepeatedDescription do
  subject(:cop) { described_class.new }

  it 'registers an offense for repeated descriptions' 
        it "does x" 


        it "does x" 

      end
    RUBY
  end

  it 'registers offense for repeated descriptions separated by a context' 
        it "does x" 


        context 'during some use case' do
          it "does x" 

        end

        it "does x" 

      end
    RUBY
  end

  it 'ignores descriptions repeated in a shared context' 
        it "does x" 


        shared_context 'shared behavior' do
          it "does x" 

        end
      end
    RUBY
  end

  it 'ignores repeated descriptions in a nested context' 
        it "does x" 


        context 'in a certain use case' do
          it "does x" 

        end
      end
    RUBY
  end

  it 'does not flag tests which do not contain description strings' 

end

