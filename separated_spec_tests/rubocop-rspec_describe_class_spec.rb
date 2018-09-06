RSpec.describe RuboCop::Cop::RSpec::DescribeClass do
  subject(:cop) { described_class.new }

  it 'checks first-line describe statements' 


  it 'supports RSpec.describe' 


  it 'checks describe statements after a require' 


  it 'checks highlights the first argument of a describe' 


  it 'ignores nested describe statements' 


  it 'ignores request specs' 


  it 'ignores feature specs' 


  it 'ignores system specs' 


  it 'ignores feature specs when RSpec.describe is used' 


  it 'flags specs with non :type metadata' 


  it 'flags normal metadata in describe' 


  it 'ignores feature specs - also with complex options' 


  it 'ignores an empty describe' 


  it 'ignores routing specs' 


  it 'ignores view specs' 


  it "doesn't blow up on single-line describes" 


  it "doesn't flag top level describe in a shared example" 
          it 'conforms to interface' 

        end
      end
    RUBY
  end

  it "doesn't flag top level describe in a shared context" 
          it 'conforms to interface' 

        end
      end
    RUBY
  end

  it "doesn't flag top level describe in an unnamed shared context" 
          it 'conforms to interface' 

        end
      end
    RUBY
  end
end

