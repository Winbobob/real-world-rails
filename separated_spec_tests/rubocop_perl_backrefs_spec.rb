# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::PerlBackrefs do
  subject(:cop) { described_class.new }

  it 'registers an offense for $1' 


  it 'auto-corrects $1 to Regexp.last_match(1)' 


  it 'auto-corrects #$1 to #{Regexp.last_match(1)}' 

end

