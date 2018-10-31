# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::EndWith do
  subject(:cop) { described_class.new }

  shared_examples 'different match methods' do |method|
    it "autocorrects #{method} /abc\\z/" 


    it "autocorrects #{method} /\\n\\z/" 


    it "autocorrects #{method} /\\t\\z/" 


    %w[. $ ^ |].each do |str|
      it "autocorrects #{method} /\\#{str}\\z/" 


      it "doesn't register an error for #{method} /#{str}\\z/" 

    end

    # escapes like "\n"
    # note that "\b" is a literal backspace char in a double-quoted string...
    # but in a regex, it's an anchor on a word boundary
    %w[a e f r t v].each do |str|
      it "autocorrects #{method} /\\#{str}\\z/" 

    end

    # character classes, anchors
    %w[w W s S d D A Z z G b B h H R X S].each do |str|
      it "doesn't register an error for #{method} /\\#{str}\\z/" 

    end

    # characters with no special meaning whatsoever
    %w[i j l m o q y].each do |str|
      it "autocorrects #{method} /\\#{str}\\z/" 

    end

    it "formats the error message correctly for #{method} /abc\\z/" 


    it "autocorrects #{method} /\\\\\\z/" 

  end

  include_examples('different match methods', '.match?')
  include_examples('different match methods', ' =~')
  include_examples('different match methods', '.match')

  it 'allows match without a receiver' 

end

