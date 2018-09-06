# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::WhenThen do
  subject(:cop) { described_class.new }

  it 'registers an offense for when x;' 


  it 'accepts when x then' 


  it 'accepts ; separating statements in the body of when' 


  it 'auto-corrects "when x;" with "when x then"' 


  # Regression: https://github.com/bbatsov/rubocop/issues/3868
  context 'when inspecting a case statement with an empty branch' do
    it 'does not register an offense' 

  end
end

