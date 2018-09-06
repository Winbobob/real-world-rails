# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::Next, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'MinBodyLength' => 1 } }

  shared_examples 'iterators' do |condition|
    let(:opposite) { condition == 'if' ? 'unless' : 'if' }

    it "registers an offense for #{condition} inside of downto" 


    it "autocorrects #{condition} inside of downto" 


    it "registers an offense for #{condition} inside of each" 


    it "autocorrects #{condition} inside of each" 


    it "registers an offense for #{condition} inside of each_with_object" 


    it "registers an offense for #{condition} inside of for" 


    it "autocorrects #{condition} inside of for" 


    it "registers an offense for #{condition} inside of loop" 


    it "registers an offense for #{condition} inside of map" 


    it "registers an offense for #{condition} inside of times" 


    it "registers an offense for #{condition} inside of collect" 


    it "registers an offense for #{condition} inside of select" 


    it "registers an offense for #{condition} inside of select!" 


    it "registers an offense for #{condition} inside of reject" 


    it "registers an offense for #{condition} inside of reject!" 


    it "registers an offense for #{condition} inside of nested iterators" 


    it "registers an offense for #{condition} inside of nested iterators" 


    it 'registers an offense for a condition at the end of an iterator ' \
       'when there is more in the iterator than the condition' do
      inspect_source(<<-RUBY.strip_indent)
        [].each do |o|
          puts o
          #{condition} o == 1
            puts o
          end
        end
      RUBY

      expect(cop.messages).to eq(['Use `next` to skip iteration.'])
      expect(cop.highlights).to eq(["#{condition} o == 1"])
    end

    it 'allows loops with conditional break' 


    it 'allows loops with conditional return' 


    it "allows loops with #{condition} being the entire body with else" 


    it "allows loops with #{condition} with else, nested in another " \
       'condition' do
      inspect_source(<<-RUBY.strip_indent)
        [].each do |o|
          if foo
            #{condition} o == 1
              puts o
            else
              puts 'no'
            end
          end
        end
      RUBY

      expect(cop.offenses.empty?).to be(true)
    end

    it "allows loops with #{condition} with else at the end" 


    it "reports an offense for #{condition} whose body has 3 lines" 


    context 'EnforcedStyle: skip_modifier_ifs' do
      let(:cop_config) do
        { 'EnforcedStyle' => 'skip_modifier_ifs' }
      end

      it "allows modifier #{condition}" 

    end

    context 'EnforcedStyle: always' do
      let(:cop_config) do
        { 'EnforcedStyle' => 'always' }
      end
      let(:opposite) { condition == 'if' ? 'unless' : 'if' }
      let(:source) do
        <<-RUBY.strip_indent
          [].each do |o|
            puts o #{condition} o == 1 # comment
          end
        RUBY
      end

      it "registers an offense for modifier #{condition}" 


      it "auto-corrects modifier #{condition}" 

    end

    it 'auto-corrects a misaligned end' 

  end

  it 'keeps comments when autocorrecting' 


  it 'handles `then` when autocorrecting' 


  it "doesn't reindent heredoc bodies when autocorrecting" 


  it 'handles nested autocorrections' 


  it_behaves_like 'iterators', 'if'
  it_behaves_like 'iterators', 'unless'

  it 'allows empty blocks' 


  it 'allows loops with conditions at the end with ternary op' 


  it 'allows super nodes' 


  it 'does not blow up on empty body until block' 


  it 'does not blow up on empty body while block' 


  it 'does not blow up on empty body for block' 


  it 'does not crash with an empty body branch' 


  it 'does not crash with empty brackets' 


  context 'MinBodyLength: 3' do
    let(:cop_config) do
      { 'MinBodyLength' => 3 }
    end

    it 'accepts if whose body has 1 line' 

  end

  context 'Invalid MinBodyLength' do
    let(:cop_config) do
      { 'MinBodyLength' => -2 }
    end

    it 'fails with an error' 

  end
end

