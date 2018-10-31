# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::Casecmp do
  subject(:cop) { described_class.new }

  shared_examples 'selectors' do |selector|
    it "autocorrects str.#{selector} ==" 


    it "autocorrects str.#{selector} == with parens around arg" 


    it "autocorrects str.#{selector} !=" 


    it "autocorrects str.#{selector} != with parens around arg" 


    it "autocorrects str.#{selector}.eql? without parens" 


    it "autocorrects str.#{selector}.eql? with parens" 


    it "autocorrects str.#{selector}.eql? with parens and funny spacing" 


    it "autocorrects == str.#{selector}" 


    it "autocorrects string with parens == str.#{selector}" 


    it "autocorrects string != str.#{selector}" 


    it 'autocorrects string with parens and funny spacing ' \
       "eql? str.#{selector}" do
      new_source = autocorrect_source("( 'string' ).eql? str.#{selector}")
      expect(new_source).to eq "str.casecmp( 'string' ).zero?"
    end

    it "autocorrects string.eql? str.#{selector} without parens " 


    it "autocorrects string.eql? str.#{selector} with parens " 


    it "autocorrects obj.#{selector} == str.#{selector}" 


    it "autocorrects obj.#{selector} eql? str.#{selector}" 


    it "formats the error message correctly for str.#{selector} ==" 


    it "formats the error message correctly for == str.#{selector}" 


    it 'formats the error message correctly for ' \
       "obj.#{selector} == str.#{selector}" do
      inspect_source("obj.#{selector} == str.#{selector}")
      expect(cop.highlights).to eq(["obj.#{selector} == str.#{selector}"])
      expect(cop.messages).to eq(
        [
          'Use `obj.casecmp(str).zero?` instead of ' \
          "`obj.#{selector} == str.#{selector}`."
        ]
      )
    end

    it "doesn't report an offense for variable == str.#{selector}" 


    it "doesn't report an offense for str.#{selector} == variable" 


    it "doesn't report an offense for obj.method == str.#{selector}" 


    it "doesn't report an offense for str.#{selector} == obj.method" 

  end

  it_behaves_like('selectors', 'upcase')
  it_behaves_like('selectors', 'downcase')
end

