# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::SpaceInsidePercentLiteralDelimiters do
  subject(:cop) { described_class.new }

  let(:message) do
    'Do not use spaces inside percent literal delimiters.'
  end

  %w[i I w W x].each do |type|
    [%w[{ }], %w[( )], %w([ ]), %w[! !]].each do |(ldelim, rdelim)|
      context "for #{type} type and #{[ldelim, rdelim]} delimiters" do
        define_method(:code_example) do |content|
          ['%', type, ldelim, content, rdelim].join
        end

        def expect_corrected(source, expected)
          expect(autocorrect_source(source)).to eq expected
        end

        it 'registers an offense for unnecessary spaces' 


        it 'registers an offense for spaces after first delimiter' 


        it 'registers an offense for spaces before final delimiter' 


        it 'registers an offense for literals with escaped and other spaces' 


        it 'accepts literals without additional spaces' 


        it 'accepts literals with escaped spaces' 


        it 'accepts multi-line literals' 


        it 'accepts multi-line literals within a method' 


        it 'accepts newlines and additional following alignment spaces' 


        it 'accepts spaces between entries' 

      end
    end
  end

  it 'accepts other percent literals' 


  it 'accepts execute-string literals' 

end

