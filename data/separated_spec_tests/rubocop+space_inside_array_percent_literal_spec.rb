# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::SpaceInsideArrayPercentLiteral do
  subject(:cop) { described_class.new }

  let(:message) do
    'Use only a single space inside array percent literal.'
  end

  %w[i I w W].each do |type|
    [%w[{ }], %w[( )], %w([ ]), %w[! !]].each do |(ldelim, rdelim)|
      context "for #{type} type and #{[ldelim, rdelim]} delimiters" do
        define_method(:code_example) do |content|
          ['%', type, ldelim, content, rdelim].join
        end

        def expect_corrected(source, expected)
          expect(autocorrect_source(source)).to eq expected
        end

        it 'registers an offense for unnecessary spaces' 


        it 'registers an offense for multiple spaces between items' 


        it 'accepts literals with escaped and additional spaces' 


        it 'accepts literals without additional spaces' 


        it 'accepts literals with escaped spaces' 


        it 'accepts multi-line literals' 


        it 'accepts multi-line literals within a method' 


        it 'accepts newlines and additional following alignment spaces' 

      end
    end
  end

  it 'accepts non array percent literals' 

end

