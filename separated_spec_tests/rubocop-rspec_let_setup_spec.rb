# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::LetSetup do
  subject(:cop) { described_class.new }

  it 'complains when let! is used and not referenced' 
        it 'does not use foo' 

      end
    RUBY
  end

  it 'ignores let! when used in `before`' 
        it 'does not use foo' 

      end
    RUBY
  end

  it 'ignores let! when used in example' 
        it 'uses foo' 

      end
    RUBY
  end

  it 'complains when let! is used and not referenced within nested group' 
          it 'does not use foo' 

        end

        it 'references some other foo' 

      end
    RUBY
  end
end

