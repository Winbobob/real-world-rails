# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::BlockDelimiters, :config do
  subject(:cop) { described_class.new(config) }

  shared_examples 'syntactic styles' do
    it 'registers an offense for a single line block with do-end' 


    it 'accepts a single line block with braces' 


    it 'accepts a multi-line block with do-end' 


    it 'accepts a multi-line block that needs braces to be valid ruby' 

  end

  context 'Semantic style' do
    cop_config = {
      'EnforcedStyle' => 'semantic',
      'ProceduralMethods' => %w[tap],
      'FunctionalMethods' => %w[let],
      'IgnoredMethods' => %w[lambda]
    }

    let(:cop_config) { cop_config }

    it 'accepts a multi-line block with braces if the return value is ' \
       'assigned' do
      inspect_source(<<-RUBY.strip_indent)
        foo = map { |x|
          x
        }
      RUBY
      expect(cop.offenses.empty?).to be(true)
    end

    it 'accepts a multi-line block with braces if it is the return value ' \
       'of its scope' do
      inspect_source(<<-RUBY.strip_indent)
        block do
          map { |x|
            x
          }
        end
      RUBY
      expect(cop.offenses.empty?).to be(true)
    end

    it 'accepts a multi-line block with braces when passed to a method' 


    it 'accepts a multi-line block with braces when chained' 


    it 'accepts a multi-line block with braces when passed to a known ' \
       'functional method' do
      inspect_source(<<-RUBY.strip_indent)
        let(:foo) {
          x
        }
      RUBY
      expect(cop.offenses.empty?).to be(true)
    end

    it 'registers an offense for a multi-line block with braces if the ' \
       'return value is not used' do
      inspect_source(<<-RUBY.strip_indent)
        each { |x|
          x
        }
      RUBY
      expect(cop.messages)
        .to eq(['Prefer `do...end` over `{...}` for procedural blocks.'])
    end

    it 'registers an offense for a multi-line block with do-end if the ' \
       'return value is assigned' do
      inspect_source(<<-RUBY.strip_indent)
        foo = map do |x|
          x
        end
      RUBY
      expect(cop.messages)
        .to eq(['Prefer `{...}` over `do...end` for functional blocks.'])
    end

    it 'registers an offense for a multi-line block with do-end if the ' \
       'return value is passed to a method' do
      inspect_source(<<-RUBY.strip_indent)
        puts (map do |x|
          x
        end)
      RUBY
      expect(cop.messages)
        .to eq(['Prefer `{...}` over `do...end` for functional blocks.'])
    end

    it 'accepts a multi-line block with do-end if it is the return value ' \
       'of its scope' do
      inspect_source(<<-RUBY.strip_indent)
        block do
          map do |x|
            x
          end
        end
      RUBY
      expect(cop.messages.empty?).to be(true)
    end

    it 'accepts a single line block with {} if used in an if statement' 


    it 'accepts a single line block with {} if used in a logical or' 


    it 'accepts a single line block with {} if used in a logical and' 


    it 'accepts a single line block with {} if used in an array' 


    it 'accepts a single line block with {} if used in an irange' 


    it 'accepts a single line block with {} if used in an erange' 


    it 'accepts a multi-line functional block with do-end if it is ' \
       'a known procedural method' do
      inspect_source(<<-RUBY.strip_indent)
        foo = bar.tap do |x|
          x.age = 3
        end
      RUBY
      expect(cop.messages.empty?).to be(true)
    end

    it 'accepts a multi-line functional block with do-end if it is ' \
       'an ignored method' do
      inspect_source(<<-RUBY.strip_indent)
        foo = lambda do
          puts 42
        end
      RUBY
      expect(cop.messages.empty?).to be(true)
    end

    it 'registers an offense for a single line procedural block' 


    it 'accepts a single line block with do-end if it is procedural' 


    context 'with a procedural block' do
      let(:corrected_source) do
        <<-RUBY.strip_indent
        each do |x|
          x
        end
        RUBY
      end

      it 'auto-corrects { and } to do and end' 


      it 'auto-corrects { and } to do and end with appropriate spacing' 

    end

    it 'does not auto-correct {} to do-end if it is a known functional ' \
       'method' do
      source = <<-RUBY.strip_indent
        let(:foo) { |x|
          x
        }
      RUBY

      new_source = autocorrect_source(source)
      expect(new_source).to eq(source)
    end

    it 'does not autocorrect do-end to {} if it is a known procedural ' \
       'method' do
      source = <<-RUBY.strip_indent
        foo = bar.tap do |x|
          x.age = 1
        end
      RUBY

      new_source = autocorrect_source(source)
      expect(new_source).to eq(source)
    end

    it 'auto-corrects do-end to {} if it is a functional block' 


    it 'auto-corrects do-end to {} with appropriate spacing' 


    it 'auto-corrects do-end to {} if it is a functional block and does ' \
       'not change the meaning' do
      source = <<-RUBY.strip_indent
        puts (map do |x|
          x
        end)
      RUBY

      expected_source = <<-RUBY.strip_indent
        puts (map { |x|
          x
        })
      RUBY

      new_source = autocorrect_source(source)
      expect(new_source).to eq(expected_source)
    end
  end

  context 'line count-based style' do
    cop_config = {
      'EnforcedStyle' => 'line_count_based',
      'IgnoredMethods' => %w[proc]
    }

    let(:cop_config) { cop_config }

    include_examples 'syntactic styles'

    it 'auto-corrects do and end for single line blocks to { and }' 


    it 'does not auto-correct do-end if {} would change the meaning' 


    it 'does not auto-correct {} if do-end would change the meaning' 


    context 'when there are braces around a multi-line block' do
      it 'registers an offense in the simple case' 


      it 'accepts braces if do-end would change the meaning' 


      it 'accepts a multi-line functional block with {} if it is ' \
         'an ignored method' do
        inspect_source(<<-RUBY.strip_indent)
          foo = proc {
            puts 42
          }
        RUBY
        expect(cop.messages.empty?).to be(true)
      end

      it 'registers an offense for braces if do-end would not change ' \
         'the meaning' do
        src = <<-RUBY.strip_indent
          scope :foo, (lambda { |f|
            where(condition: "value")
          })

          expect { something }.to(raise_error(ErrorClass) { |error|
            # ...
          })
        RUBY
        inspect_source(src)
        expect(cop.offenses.size).to eq(2)
      end

      it 'can handle special method names such as []= and done?' 


      it 'auto-corrects { and } to do and end' 


      it 'auto-corrects adjacent curly braces correctly' 


      it 'does not auto-correct {} if do-end would introduce a syntax error' 

    end
  end

  context 'braces for chaining style' do
    cop_config = {
      'EnforcedStyle' => 'braces_for_chaining',
      'IgnoredMethods' => %w[proc]
    }

    let(:cop_config) { cop_config }

    include_examples 'syntactic styles'

    it 'registers an offense for multi-line chained do-end blocks' 


    it 'auto-corrects do-end for chained blocks' 


    it 'accepts a multi-line functional block with {} if it is ' \
       'an ignored method' do
      inspect_source(<<-RUBY.strip_indent)
        foo = proc {
          puts 42
        }
      RUBY
      expect(cop.messages.empty?).to be(true)
    end

    context 'when there are braces around a multi-line block' do
      it 'registers an offense in the simple case' 


      it 'allows when the block is being chained' 

    end
  end
end

