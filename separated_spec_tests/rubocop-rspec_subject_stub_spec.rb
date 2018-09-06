# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::SubjectStub do
  subject(:cop) { described_class.new }

  it 'complains when subject is stubbed' 
        it 'uses expect twice' 

      end
    RUBY
  end

  it 'complains when subject is mocked' 
        it 'uses expect twice' 

      end
    RUBY
  end

  it 'ignores stub within context where subject name changed' 
          it 'tries to trick rubocop-rspec' 

        end
      end
    RUBY
  end

  it 'ignores stub when inside all matcher' 
        it 'tries to trick rubocop-rspec' 

      end
    RUBY
  end

  it 'flags nested subject stubs when nested subject uses same name' 
          it 'tries to trick rubocop-rspec' 

        end
      end
    RUBY
  end

  it 'ignores nested stubs when nested subject is anonymous' 
          it 'tries to trick rubocop-rspec' 

        end
      end
    RUBY
  end

  it 'flags nested subject stubs when example group does not define subject' 
          it 'tries to trick rubocop-rspec' 

        end
      end
    RUBY
  end

  it 'flags nested subject stubs' 
          it 'tries to trick rubocop-rspec' 

        end
      end
    RUBY
  end

  it 'flags nested subject stubs when adjacent context redefines' 
        it 'still flags this test' 

      end
    RUBY
  end

  it 'flags deeply nested subject stubs' 

end

