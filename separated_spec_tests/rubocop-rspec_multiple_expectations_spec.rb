# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::MultipleExpectations, :config do
  subject(:cop) { described_class.new(config) }

  context 'without configuration' do
    let(:cop_config) { {} }

    it 'flags multiple expectations' 
          it 'uses expect twice' 

        end
      RUBY
    end

    it 'approves of one expectation per example' 
          it 'does something neat' 


          it 'does something cool' 

        end
      RUBY
    end

    it 'flags multiple expect_any_instance_of' 
          it 'uses expect_any_instance_of twice' 

        end
      RUBY
    end

    it 'flags multiple is_expected' 
          it 'uses expect_any_instance_of twice' 

        end
      RUBY
    end

    it 'flags multiple expects with blocks' 
          it 'uses expect with block twice' 

        end
      RUBY
    end

    it 'counts aggregate_failures as one expectation' 
          it 'aggregates failures' 

        end
      RUBY
    end

    it 'counts every aggregate_failures as an expectation' 
          it 'has multiple aggregate_failures calls' 

        end
      RUBY
    end
  end

  context 'with meta data' do
    it 'ignores examples with `:aggregate_failures`' 


    it 'ignores examples with `aggregate_failures: true`' 


    it 'checks examples with `aggregate_failures: false`' 

  end

  context 'with Max configuration' do
    let(:cop_config) do
      { 'Max' => '2' }
    end

    it 'permits two expectations' 
          it 'uses expect twice' 

        end
      RUBY
    end

    it 'flags three expectations' 
          it 'uses expect three times' 

        end
      RUBY
    end
  end

  context 'with AggregateFailuresByDefault configuration' do
    let(:cop_config) do
      { 'AggregateFailuresByDefault' => true }
    end

    it 'ignores examples without metadata' 
          it 'uses expect twice' 

        end
      RUBY
    end

    it 'ignores examples with `:aggregate_failures`' 


    it 'ignores examples with `aggregate_failures: true`' 


    it 'checks examples with `aggregate_failures: false`' 

  end

  it 'generates a todo based on the worst violation' 
        it 'uses expect twice' 


        it 'uses expect three times' 

      end
    RUBY

    expect(cop.config_to_allow_offenses).to eq('Max' => 3)
  end
end

