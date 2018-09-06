RSpec.describe RuboCop::Cop::RSpec::Focus do
  subject(:cop) { described_class.new }

  # rubocop:disable RSpec/ExampleLength
  it 'flags all rspec example blocks with that include `focus: true`' 


  it 'flags all rspec example blocks that include `:focus`' 

  # rubocop:enable RSpec/ExampleLength

  it 'does not flag unfocused specs' 


  it 'does not flag a method that is focused twice' 


  it 'ignores non-rspec code with :focus blocks' 


  it 'flags focused block types' 

end

