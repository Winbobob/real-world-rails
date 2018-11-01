# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::PercentStringArray do
  subject(:cop) { described_class.new }

  context 'detecting quotes or commas in a %w/%W string' do
    %w[w W].each do |char|
      it 'accepts tokens without quotes or commas' 


      [
        %(%#{char}(' ")),
        %(%#{char}(' " ! = # ,)),
        ':"#{a}"',
        %(%#{char}(\#{a} b))
      ].each do |false_positive|
        it "accepts likely false positive #{false_positive}" 

      end

      it 'adds an offense if tokens contain quotes and are comma separated' 


      it 'adds an offense if tokens contain both types of quotes' 


      it 'adds an offense if one token is quoted but there are no commas' 


      it 'adds an offense if there are no quotes but one comma' 

    end
  end

  context 'autocorrection' do
    let(:source) do
      <<-SOURCE
      %w('a', "b", c', "d, e f)
      %W('a', "b", c', "d, e f)
      SOURCE
    end
    let(:expected_corrected_source) do
      <<-CORRECTED_SOURCE
      %w(a b c d e f)
      %W(a b c d e f)
      CORRECTED_SOURCE
    end

    it 'removes undesirable characters' 

  end

  context 'with invalid byte sequence in UTF-8' do
    it 'add an offense if tokens contain quotes' 


    it 'accepts if tokens contain invalid byte sequence only' 

  end

  context 'with binary encoded source' do
    it 'adds an offense if tokens contain quotes' 


    it 'accepts if tokens contain no quotes' 

  end
end

