# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::AccessModifierIndentation do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    c = cop_config.merge('SupportedStyles' => %w[indent outdent])
    RuboCop::Config
      .new('Layout/AccessModifierIndentation' => c,
           'Layout/IndentationWidth' => { 'Width' => indentation_width })
  end
  let(:indentation_width) { 2 }

  context 'when EnforcedStyle is set to indent' do
    let(:cop_config) { { 'EnforcedStyle' => 'indent' } }

    it 'registers an offense for misaligned private' 


    it 'registers an offense for misaligned private in module' 


    it 'registers an offense for misaligned module_function in module' 


    it 'registers an offense for correct + opposite alignment' 


    it 'registers an offense for opposite + correct alignment' 


    it 'registers an offense for misaligned private in singleton class' 


    it 'registers an offense for misaligned private in class ' \
       'defined with Class.new' do
      inspect_source(<<-RUBY.strip_indent)
        Test = Class.new do

        private

          def test; end
        end
      RUBY
      expect(cop.offenses.size).to eq(1)
      expect(cop.messages)
        .to eq(['Indent access modifiers like `private`.'])
    end

    it 'accepts misaligned private in blocks that are not recognized as ' \
       'class/module definitions' do
      inspect_source(<<-RUBY.strip_indent)
        Test = func do

        private

          def test; end
        end
      RUBY
      expect(cop.offenses.empty?).to be(true)
    end

    it 'registers an offense for misaligned private in module ' \
       'defined with Module.new' do
      inspect_source(<<-RUBY.strip_indent)
        Test = Module.new do

        private

          def test; end
        end
      RUBY
      expect(cop.offenses.size).to eq(1)
      expect(cop.messages)
        .to eq(['Indent access modifiers like `private`.'])
    end

    it 'registers an offense for misaligned protected' 


    it 'accepts properly indented private' 


    it 'accepts properly indented protected' 


    it 'accepts an empty class' 


    it 'accepts methods with a body' 


    it 'handles properly nested classes' 


    it 'auto-corrects incorrectly indented access modifiers' 


    context 'when 4 spaces per indent level are used' do
      let(:indentation_width) { 4 }

      it 'accepts properly indented private' 

    end

    context 'when indentation width is overridden for this cop only' do
      let(:cop_config) do
        { 'EnforcedStyle' => 'indent', 'IndentationWidth' => 4 }
      end

      it 'accepts properly indented private' 

    end
  end

  context 'when EnforcedStyle is set to outdent' do
    let(:cop_config) { { 'EnforcedStyle' => 'outdent' } }
    let(:indent_msg) { 'Outdent access modifiers like `private`.' }

    it 'registers offense for private indented to method depth in a class' 


    it 'registers offense for private indented to method depth in a module' 


    it 'registers offense for module fn indented to method depth in a module' 


    it 'registers offense for private indented to method depth in singleton' \
       'class' do
      inspect_source(<<-RUBY.strip_indent)
        class << self

          private

          def test; end
        end
      RUBY
      expect(cop.offenses.size).to eq(1)
      expect(cop.messages).to eq([indent_msg])
    end

    it 'registers offense for private indented to method depth in class ' \
       'defined with Class.new' do
      inspect_source(<<-RUBY.strip_indent)
        Test = Class.new do

          private

          def test; end
        end
      RUBY
      expect(cop.offenses.size).to eq(1)
      expect(cop.messages).to eq([indent_msg])
    end

    it 'registers offense for private indented to method depth in module ' \
       'defined with Module.new' do
      inspect_source(<<-RUBY.strip_indent)
        Test = Module.new do

          private

          def test; end
        end
      RUBY
      expect(cop.offenses.size).to eq(1)
      expect(cop.messages).to eq([indent_msg])
    end

    it 'accepts private indented to the containing class indent level' 


    it 'accepts protected indented to the containing class indent level' 


    it 'handles properly nested classes' 


    it 'auto-corrects incorrectly indented access modifiers' 


    it 'auto-corrects private in complicated case' 

  end
end

