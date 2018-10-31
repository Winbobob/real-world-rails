# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::BlockAlignment, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    { 'EnforcedStyleAlignWith' => 'either' }
  end

  context 'when the block has no arguments' do
    it 'registers an offense for mismatched block end' 


    it 'auto-corrects alignment' 

  end

  context 'when the block has arguments' do
    it 'registers an offense for mismatched block end' 


    it 'auto-corrects alignment' 

  end

  it 'accepts a block end that does not begin its line' 


  context 'when the block is a logical operand' do
    it 'accepts a correctly aligned block end' 

  end

  it 'accepts end aligned with a variable' 


  context 'when there is an assignment chain' do
    it 'registers an offense for an end aligned with the 2nd variable' 


    it 'accepts end aligned with the first variable' 


    it 'auto-corrects alignment to the first variable' 

  end

  context 'and the block is an operand' do
    it 'accepts end aligned with a variable' 

  end

  it 'registers an offense for mismatched block end with a variable' 


  context 'when the block is defined on the next line' do
    it 'accepts end aligned with the block expression' 


    it 'registers an offenses for mismatched end alignment' 


    it 'auto-corrects alignment' 

  end

  context 'when the method part is a call chain that spans several lines' do
    # Example from issue 346 of rubocop-hq/rubocop on github:
    it 'accepts pretty alignment style' 


    it 'registers offenses for misaligned ends' 


    # Example from issue 393 of rubocop-hq/rubocop on github:
    it 'accepts end indented as the start of the block' 


    # Example from issue 447 of rubocop-hq/rubocop on github:
    it 'accepts two kinds of end alignment' 


    it 'auto-corrects misaligned ends with the start of the expression' 

  end

  context 'when variables of a mass assignment spans several lines' do
    it 'accepts end aligned with the variables' 


    it 'registers an offense for end aligned with the block' 


    it 'auto-corrects' 

  end

  it 'accepts end aligned with an instance variable' 


  it 'registers an offense for mismatched block end with' \
     ' an instance variable' do
    expect_offense(<<-RUBY.strip_indent)
      @variable = test do |ala|
        end
        ^^^ `end` at 2, 2 is not aligned with `@variable = test do |ala|` at 1, 0.
    RUBY
  end

  it 'accepts end aligned with a class variable' 


  it 'registers an offense for mismatched block end with a class variable' 


  it 'accepts end aligned with a global variable' 


  it 'registers an offense for mismatched block end with a global variable' 


  it 'accepts end aligned with a constant' 


  it 'registers an offense for mismatched block end with a constant' 


  it 'accepts end aligned with a method call' 


  it 'registers an offense for mismatched block end with a method call' 


  it 'accepts end aligned with a method call with arguments' 


  it 'registers an offense for mismatched end with a method call' \
     ' with arguments' do
    expect_offense(<<-RUBY.strip_indent)
      @h[:f] = f.each_pair.map do |f, v|
        v = 1
        end
        ^^^ `end` at 3, 2 is not aligned with `@h[:f] = f.each_pair.map do |f, v|` at 1, 0.
    RUBY
  end

  it 'does not raise an error for nested block in a method call' 


  it 'accepts end aligned with the block when the block is a method argument' 


  it 'registers an offense for mismatched end not aligned with the block' \
     ' that is an argument' do
    expect_offense(<<-RUBY.strip_indent)
      expect(arr.all? do |o|
        o.valid?
        end)
        ^^^ `end` at 3, 2 is not aligned with `arr.all? do |o|` at 1, 7 or `expect(arr.all? do |o|` at 1, 0.
    RUBY
  end

  it 'accepts end aligned with an op-asgn (+=, -=)' 


  it 'registers an offense for mismatched block end with an op-asgn (+=, -=)' 


  it 'accepts end aligned with an and-asgn (&&=)' 


  it 'registers an offense for mismatched block end with an and-asgn (&&=)' 


  it 'accepts end aligned with an or-asgn (||=)' 


  it 'registers an offense for mismatched block end with an or-asgn (||=)' 


  it 'accepts end aligned with a mass assignment' 


  it 'accepts end aligned with a call chain left hand side' 


  it 'registers an offense for mismatched block end with a mass assignment' 


  context 'when multiple similar-looking blocks have misaligned ends' do
    it 'registers an offense for each of them' 

  end

  context 'on a splatted method call' do
    it 'aligns end with the splat operator' 


    it 'autocorrects' 

  end

  context 'on a bit-flipped method call' do
    it 'aligns end with the ~ operator' 


    it 'autocorrects' 

  end

  context 'on a logically negated method call' do
    it 'aligns end with the ! operator' 


    it 'autocorrects' 

  end

  context 'on an arithmetically negated method call' do
    it 'aligns end with the - operator' 


    it 'autocorrects' 

  end

  context 'when the block is terminated by }' do
    it 'mentions } (not end) in the message' 

  end

  context 'when configured to align with start_of_line' do
    let(:cop_config) do
      { 'EnforcedStyleAlignWith' => 'start_of_line' }
    end

    it 'allows when start_of_line aligned' 


    it 'errors when do aligned' 


    it 'autocorrects' 

  end

  context 'when configured to align with do' do
    let(:cop_config) do
      { 'EnforcedStyleAlignWith' => 'start_of_block' }
    end

    it 'allows when do aligned' 


    it 'errors when start_of_line aligned' 


    it 'autocorrects' 

  end
end

