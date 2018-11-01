# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::RegexpLiteral, :config do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    supported_styles = {
      'SupportedStyles' => %w[slashes percent_r mixed]
    }
    RuboCop::Config.new('Style/PercentLiteralDelimiters' =>
                          percent_literal_delimiters_config,
                        'Style/RegexpLiteral' =>
                          cop_config.merge(supported_styles))
  end
  let(:percent_literal_delimiters_config) do
    { 'PreferredDelimiters' => { '%r' => '{}' } }
  end

  describe 'when regex contains slashes in interpolation' do
    let(:cop_config) { { 'EnforcedStyle' => 'slashes' } }

    it 'ignores the slashes that do not belong // regex' 

  end

  describe '%r regex with other delimiters than curly braces' do
    let(:cop_config) { { 'EnforcedStyle' => 'slashes' } }

    it 'registers an offense' 

  end

  describe 'when PercentLiteralDelimiters is configured with brackets' do
    let(:cop_config) { { 'EnforcedStyle' => 'percent_r' } }
    let(:percent_literal_delimiters_config) do
      { 'PreferredDelimiters' => { '%r' => '[]' } }
    end

    it 'respects the configuration when auto-correcting' 

  end

  context 'when EnforcedStyle is set to slashes' do
    let(:cop_config) { { 'EnforcedStyle' => 'slashes' } }

    describe 'a single-line `//` regex without slashes' do
      it 'is accepted' 

    end

    describe 'a single-line `//` regex with slashes' do
      let(:source) { 'foo = /home\//' }

      it 'registers an offense' 


      it 'cannot auto-correct' 


      describe 'when configured to allow inner slashes' do
        before { cop_config['AllowInnerSlashes'] = true }

        it 'is accepted' 

      end
    end

    describe 'a multi-line `//` regex without slashes' do
      it 'is accepted' 

    end

    describe 'a multi-line `//` regex with slashes' do
      let(:source) do
        <<-'RUBY'.strip_indent
          foo = /
            https?:\/\/
            example\.com
          /x
        RUBY
      end

      it 'registers an offense' 


      it 'cannot auto-correct' 


      describe 'when configured to allow inner slashes' do
        before { cop_config['AllowInnerSlashes'] = true }

        it 'is accepted' 

      end
    end

    describe 'a single-line %r regex without slashes' do
      let(:source) { 'foo = %r{a}' }

      it 'registers an offense' 


      it 'auto-corrects' 

    end

    describe 'a single-line %r regex with slashes' do
      let(:source) { 'foo = %r{home/}' }

      it 'is accepted' 


      describe 'when configured to allow inner slashes' do
        before { cop_config['AllowInnerSlashes'] = true }

        it 'registers an offense' 


        it 'cannot auto-correct' 

      end
    end

    describe 'a multi-line %r regex without slashes' do
      let(:source) do
        <<-'RUBY'.strip_indent.chomp
          foo = %r{
            foo
            bar
          }x
        RUBY
      end

      it 'registers an offense' 


      it 'auto-corrects' 

    end

    describe 'a multi-line %r regex with slashes' do
      let(:source) do
        <<-'RUBY'.strip_indent
          foo = %r{
            https?://
            example\.com
          }x
        RUBY
      end

      it 'is accepted' 


      describe 'when configured to allow inner slashes' do
        before { cop_config['AllowInnerSlashes'] = true }

        it 'registers an offense' 


        it 'cannot auto-correct' 

      end
    end
  end

  context 'when EnforcedStyle is set to percent_r' do
    let(:cop_config) { { 'EnforcedStyle' => 'percent_r' } }

    describe 'a single-line `//` regex without slashes' do
      let(:source) { 'foo = /a/' }

      it 'registers an offense' 


      it 'auto-corrects' 

    end

    describe 'a single-line `//` regex with slashes' do
      let(:source) { 'foo = /home\//' }

      it 'registers an offense' 


      it 'cannot auto-correct' 

    end

    describe 'a multi-line `//` regex without slashes' do
      let(:source) do
        <<-'RUBY'.strip_indent.chomp
          foo = /
            foo
            bar
          /x
        RUBY
      end

      it 'registers an offense' 


      it 'auto-corrects' 

    end

    describe 'a multi-line `//` regex with slashes' do
      let(:source) do
        <<-'RUBY'.strip_indent
          foo = /
            https?:\/\/
            example\.com
          /x
        RUBY
      end

      it 'registers an offense' 


      it 'cannot auto-correct' 

    end

    describe 'a single-line %r regex without slashes' do
      it 'is accepted' 

    end

    describe 'a single-line %r regex with slashes' do
      it 'is accepted' 

    end

    describe 'a multi-line %r regex without slashes' do
      it 'is accepted' 

    end

    describe 'a multi-line %r regex with slashes' do
      it 'is accepted' 

    end
  end

  context 'when EnforcedStyle is set to mixed' do
    let(:cop_config) { { 'EnforcedStyle' => 'mixed' } }

    describe 'a single-line `//` regex without slashes' do
      it 'is accepted' 

    end

    describe 'a single-line `//` regex with slashes' do
      let(:source) { 'foo = /home\//' }

      it 'registers an offense' 


      it 'cannot auto-correct' 


      describe 'when configured to allow inner slashes' do
        before { cop_config['AllowInnerSlashes'] = true }

        it 'is accepted' 

      end
    end

    describe 'a multi-line `//` regex without slashes' do
      let(:source) do
        <<-'RUBY'.strip_indent.chomp
          foo = /
            foo
            bar
          /x
        RUBY
      end

      it 'registers an offense' 


      it 'auto-corrects' 

    end

    describe 'a multi-line `//` regex with slashes' do
      let(:source) do
        <<-'RUBY'.strip_indent
          foo = /
            https?:\/\/
            example\.com
          /x
        RUBY
      end

      it 'registers an offense' 


      it 'cannot auto-correct' 

    end

    describe 'a single-line %r regex without slashes' do
      let(:source) { 'foo = %r{a}' }

      it 'registers an offense' 


      it 'auto-corrects' 

    end

    describe 'a single-line %r regex with slashes' do
      let(:source) { 'foo = %r{home/}' }

      it 'is accepted' 


      describe 'when configured to allow inner slashes' do
        before { cop_config['AllowInnerSlashes'] = true }

        it 'registers an offense' 


        it 'cannot auto-correct' 

      end
    end

    describe 'a multi-line %r regex without slashes' do
      it 'is accepted' 

    end

    describe 'a multi-line %r regex with slashes' do
      it 'is accepted' 

    end
  end
end

