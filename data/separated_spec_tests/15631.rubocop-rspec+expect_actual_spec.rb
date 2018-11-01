# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::ExpectActual, :config do
  subject(:cop) { described_class.new(config) }

  it 'flags numeric literal values within expect(...)' 
        it 'uses expect incorrectly' 

      end
    RUBY
  end

  it 'flags boolean literal values within expect(...)' 
        it 'uses expect incorrectly' 

      end
    RUBY
  end

  it 'flags string and symbol literal values within expect(...)' 
        it 'uses expect incorrectly' 

      end
    RUBY
  end

  it 'flags literal nil value within expect(...)' 
        it 'uses expect incorrectly' 

      end
    RUBY
  end

  it 'does not flag dynamic values within expect(...)' 
        it 'uses expect correctly' 

      end
    RUBY
  end

  it 'flags arrays containing only literal values within expect(...)' 
        it 'uses expect incorrectly' 

      end
    RUBY
  end

  it 'flags hashes containing only literal values within expect(...)' 
        it 'uses expect incorrectly' 

      end
    RUBY
  end

  it 'flags ranges containing only literal values within expect(...)' 
        it 'uses expect incorrectly' 

      end
    RUBY
  end

  it 'flags regexps containing only literal values within expect(...)' 
        it 'uses expect incorrectly' 

      end
    RUBY
  end

  it 'does not flag complex values with dynamic parts within expect(...)' 
        it 'uses expect incorrectly' 

      end
    RUBY
  end

  context 'when inspecting rspec-rails routing specs' do
    let(:cop_config) { {} }

    it 'ignores rspec-rails routing specs' 

  end
end

