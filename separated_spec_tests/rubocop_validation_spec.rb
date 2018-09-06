# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::Validation do
  subject(:cop) { described_class.new }

  described_class::BLACKLIST.each_with_index do |validation, number|
    it "registers an offense for #{validation}" 


    it "outputs the correct message for #{validation}" 

  end

  described_class::TYPES.each do |parameter|
    it "autocorrect validates_#{parameter}_of" 

  end

  it 'accepts new style validations' 


  it 'autocorrect validates_length_of' 

end

