# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Metrics::BlockNesting, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'Max' => 2 } }

  shared_examples 'too deep' do |source, lines, max_to_allow = 3|
    it "registers #{lines.length} offense(s)" 


    it 'sets `Max` value correctly' 

  end

  it 'accepts `Max` levels of nesting' 


  context '`Max + 1` levels of `if` nesting' do
    source = <<-RUBY.strip_indent
      if a
        if b
          if c
            puts c
          end
        end
      end
    RUBY
    it_behaves_like 'too deep', source, [3]
  end

  context '`Max + 2` levels of `if` nesting' do
    source = <<-RUBY.strip_indent
      if a
        if b
          if c
            if d
              puts d
            end
          end
        end
      end
    RUBY
    it_behaves_like 'too deep', source, [3], 4
  end

  context 'Multiple nested `ifs` at same level' do
    source = <<-RUBY.strip_indent
      if a
        if b
          if c
            puts c
          end
        end
        if d
          if e
            puts e
          end
        end
      end
    RUBY
    it_behaves_like 'too deep', source, [3, 8]
  end

  context 'nested `case`' do
    source = <<-RUBY.strip_indent
      if a
        if b
          case c
            when C
              puts C
          end
        end
      end
    RUBY
    it_behaves_like 'too deep', source, [3]
  end

  context 'nested `while`' do
    source = <<-RUBY.strip_indent
      if a
        if b
          while c
            puts c
          end
        end
      end
    RUBY
    it_behaves_like 'too deep', source, [3]
  end

  context 'nested modifier `while`' do
    source = <<-RUBY.strip_indent
      if a
        if b
          begin
            puts c
          end while c
        end
      end
    RUBY
    it_behaves_like 'too deep', source, [3]
  end

  context 'nested `until`' do
    source = <<-RUBY.strip_indent
      if a
        if b
          until c
            puts c
          end
        end
      end
    RUBY
    it_behaves_like 'too deep', source, [3]
  end

  context 'nested modifier `until`' do
    source = <<-RUBY.strip_indent
      if a
        if b
          begin
            puts c
          end until c
        end
      end
    RUBY
    it_behaves_like 'too deep', source, [3]
  end

  context 'nested `for`' do
    source = <<-RUBY.strip_indent
      if a
        if b
          for c in [1,2] do
            puts c
          end
        end
      end
    RUBY
    it_behaves_like 'too deep', source, [3]
  end

  context 'nested `rescue`' do
    source = <<-RUBY.strip_indent
      if a
        if b
          begin
            puts c
          rescue
            puts x
          end
        end
      end
    RUBY
    it_behaves_like 'too deep', source, [5]
  end

  it 'accepts if/elsif' 


  context 'when CountBlocks is false' do
    let(:cop_config) { { 'Max' => 2, 'CountBlocks' => false } }

    it 'accepts nested multiline blocks' 


    it 'accepts nested inline blocks' 

  end

  context 'when CountBlocks is true' do
    let(:cop_config) { { 'Max' => 2, 'CountBlocks' => true } }

    context 'nested multiline block' do
      source = <<-RUBY.strip_indent
        if a
          if b
            [1, 2].each do |c|
              puts c
            end
          end
        end
      RUBY
      it_behaves_like 'too deep', source, [3]
    end

    context 'nested inline block' do
      source = <<-RUBY.strip_indent
        if a
          if b
            [1, 2].each { |c| puts c }
          end
        end
      RUBY
      it_behaves_like 'too deep', source, [3]
    end
  end
end

