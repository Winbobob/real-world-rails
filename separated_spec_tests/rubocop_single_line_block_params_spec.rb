# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::SingleLineBlockParams, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    { 'Methods' =>
      [{ 'reduce' => %w[a e] },
       { 'test' => %w[x y] }] }
  end

  it 'finds wrong argument names in calls with different syntax' 


  it 'allows calls with proper argument names' 


  it 'allows an unused parameter to have a leading underscore' 


  it 'finds incorrectly named parameters with leading underscores' 


  it 'ignores do..end blocks' 


  it 'ignores :reduce symbols' 


  it 'does not report when destructuring is used' 


  it 'does not report if no block arguments are present' 

end

