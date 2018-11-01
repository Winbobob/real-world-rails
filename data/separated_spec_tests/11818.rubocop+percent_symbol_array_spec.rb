# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::PercentSymbolArray do
  subject(:cop) { described_class.new }

  context 'detecting colons or commas in a %i/%I string' do
    %w[i I].each do |char|
      it 'accepts tokens without colons or commas' 


      it 'accepts likely false positive $,' 


      it 'adds an offense if symbols contain colons and are comma separated' 


      it 'adds an offense if one symbol has a colon but there are no commas' 


      it 'adds an offense if there are no colons but one comma' 

    end
    context 'with binary encoded source' do
      it 'adds an offense if tokens contain quotes' 


      it 'accepts if tokens contain no quotes' 

    end
  end

  context 'autocorrection' do
    let(:source) do
      <<-SOURCE
      %i(:a, :b, c, d e :f)
      %I(:a, :b, c, d e :f)
      SOURCE
    end
    let(:expected_corrected_source) do
      <<-CORRECTED_SOURCE
      %i(a b c d e f)
      %I(a b c d e f)
      CORRECTED_SOURCE
    end

    it 'removes undesirable characters' 

  end
end

