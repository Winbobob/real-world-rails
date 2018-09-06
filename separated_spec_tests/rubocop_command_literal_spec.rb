# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::CommandLiteral, :config do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    supported_styles = {
      'SupportedStyles' => %w[backticks percent_x mixed]
    }
    RuboCop::Config.new('Style/PercentLiteralDelimiters' =>
                          percent_literal_delimiters_config,
                        'Style/CommandLiteral' =>
                          cop_config.merge(supported_styles))
  end
  let(:percent_literal_delimiters_config) do
    { 'PreferredDelimiters' => { '%x' => '()' } }
  end

  describe '%x commands with other delimiters than parentheses' do
    let(:cop_config) { { 'EnforcedStyle' => 'backticks' } }

    it 'registers an offense' 

  end

  describe 'when PercentLiteralDelimiters is configured with curly braces' do
    let(:cop_config) { { 'EnforcedStyle' => 'percent_x' } }
    let(:percent_literal_delimiters_config) do
      { 'PreferredDelimiters' => { '%x' => '[]' } }
    end

    it 'respects the configuration when auto-correcting' 

  end

  describe 'when PercentLiteralDelimiters only has a default' do
    let(:cop_config) { { 'EnforcedStyle' => 'percent_x' } }
    let(:percent_literal_delimiters_config) do
      { 'PreferredDelimiters' => { 'default' => '()' } }
    end

    it 'respects the configuration when auto-correcting' 

  end

  describe 'when PercentLiteralDelimiters is configured and a default exists' do
    let(:cop_config) { { 'EnforcedStyle' => 'percent_x' } }
    let(:percent_literal_delimiters_config) do
      { 'PreferredDelimiters' => { '%x' => '[]', 'default' => '()' } }
    end

    it 'ignores the default when auto-correcting and' 

  end

  describe 'heredoc commands' do
    let(:cop_config) { { 'EnforcedStyle' => 'backticks' } }

    it 'is ignored' 

  end

  context 'when EnforcedStyle is set to backticks' do
    let(:cop_config) { { 'EnforcedStyle' => 'backticks' } }

    describe 'a single-line ` string without backticks' do
      it 'is accepted' 

    end

    describe 'a single-line ` string with backticks' do
      let(:source) { 'foo = `echo \`ls\``' }

      it 'registers an offense' 


      it 'cannot auto-correct' 


      describe 'when configured to allow inner backticks' do
        before { cop_config['AllowInnerBackticks'] = true }

        it 'is accepted' 

      end
    end

    describe 'a multi-line ` string without backticks' do
      it 'is accepted' 

    end

    describe 'a multi-line ` string with backticks' do
      let(:source) do
        ['foo = `',
         '  echo \`ls\`',
         '  echo \`ls -l\`',
         '`']
      end

      it 'registers an offense' 


      it 'cannot auto-correct' 


      describe 'when configured to allow inner backticks' do
        before { cop_config['AllowInnerBackticks'] = true }

        it 'is accepted' 

      end
    end

    describe 'a single-line %x string without backticks' do
      let(:source) { 'foo = %x(ls)' }

      it 'registers an offense' 


      it 'auto-corrects' 

    end

    describe 'a single-line %x string with backticks' do
      let(:source) { 'foo = %x(echo `ls`)' }

      it 'is accepted' 


      describe 'when configured to allow inner backticks' do
        before { cop_config['AllowInnerBackticks'] = true }

        it 'registers an offense' 


        it 'cannot auto-correct' 

      end
    end

    describe 'a multi-line %x string without backticks' do
      let(:source) do
        ['foo = %x(',
         '  ls',
         '  ls -l',
         ')']
      end

      it 'registers an offense' 


      it 'auto-corrects' 

    end

    describe 'a multi-line %x string with backticks' do
      let(:source) do
        ['foo = %x(',
         '  echo `ls`',
         '  echo `ls -l`',
         ')']
      end

      it 'is accepted' 


      describe 'when configured to allow inner backticks' do
        before { cop_config['AllowInnerBackticks'] = true }

        it 'registers an offense' 


        it 'cannot auto-correct' 

      end
    end
  end

  context 'when EnforcedStyle is set to percent_x' do
    let(:cop_config) { { 'EnforcedStyle' => 'percent_x' } }

    describe 'a single-line ` string without backticks' do
      let(:source) { 'foo = `ls`' }

      it 'registers an offense' 


      it 'auto-corrects' 

    end

    describe 'a single-line ` string with backticks' do
      let(:source) { 'foo = `echo \`ls\``' }

      it 'registers an offense' 


      it 'cannot auto-correct' 

    end

    describe 'a multi-line ` string without backticks' do
      let(:source) do
        ['foo = `',
         '  ls',
         '  ls -l',
         '`']
      end

      it 'registers an offense' 


      it 'auto-corrects' 

    end

    describe 'a multi-line ` string with backticks' do
      let(:source) do
        ['foo = `',
         '  echo \`ls\`',
         '  echo \`ls -l\`',
         '`']
      end

      it 'registers an offense' 


      it 'cannot auto-correct' 

    end

    describe 'a single-line %x string without backticks' do
      it 'is accepted' 

    end

    describe 'a single-line %x string with backticks' do
      it 'is accepted' 

    end

    describe 'a multi-line %x string without backticks' do
      it 'is accepted' 

    end

    describe 'a multi-line %x string with backticks' do
      it 'is accepted' 

    end
  end

  context 'when EnforcedStyle is set to mixed' do
    let(:cop_config) { { 'EnforcedStyle' => 'mixed' } }

    describe 'a single-line ` string without backticks' do
      it 'is accepted' 

    end

    describe 'a single-line ` string with backticks' do
      let(:source) { 'foo = `echo \`ls\``' }

      it 'registers an offense' 


      it 'cannot auto-correct' 


      describe 'when configured to allow inner backticks' do
        before { cop_config['AllowInnerBackticks'] = true }

        it 'is accepted' 

      end
    end

    describe 'a multi-line ` string without backticks' do
      let(:source) do
        ['foo = `',
         '  ls',
         '  ls -l',
         '`']
      end

      it 'registers an offense' 


      it 'auto-corrects' 

    end

    describe 'a multi-line ` string with backticks' do
      let(:source) do
        ['foo = `',
         '  echo \`ls\`',
         '  echo \`ls -l\`',
         '`']
      end

      it 'registers an offense' 


      it 'cannot auto-correct' 

    end

    describe 'a single-line %x string without backticks' do
      let(:source) { 'foo = %x(ls)' }

      it 'registers an offense' 


      it 'auto-corrects' 

    end

    describe 'a single-line %x string with backticks' do
      let(:source) { 'foo = %x(echo `ls`)' }

      it 'is accepted' 


      describe 'when configured to allow inner backticks' do
        before { cop_config['AllowInnerBackticks'] = true }

        it 'registers an offense' 


        it 'cannot auto-correct' 

      end
    end

    describe 'a multi-line %x string without backticks' do
      it 'is accepted' 

    end

    describe 'a multi-line %x string with backticks' do
      it 'is accepted' 

    end
  end
end

