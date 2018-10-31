# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::AndOr, :config do
  context 'when style is conditionals' do
    cop_config = {
      'EnforcedStyle' => 'conditionals'
    }

    subject(:cop) { described_class.new(config) }

    let(:cop_config) { cop_config }

    %w[and or].each do |operator|
      it "accepts \"#{operator}\" outside of conditional" 


      {
        'if' => 'if %<condition>s; %<body>s; end',
        'while' => 'while %<condition>s; %<body>s; end',
        'until' => 'until %<condition>s; %<body>s; end',
        'post-conditional while' => 'begin; %<body>s; end while %<condition>s',
        'post-conditional until' => 'begin; %<body>s; end until %<condition>s'
      }.each do |type, snippet_format|
        it "registers an offense for \"#{operator}\" in #{type} conditional" 


        it "accepts \"#{operator}\" in #{type} body" 

      end
    end

    %w[&& ||].each do |operator|
      it "accepts #{operator} inside of conditional" 


      it "accepts #{operator} outside of conditional" 

    end
  end

  context 'when style is always' do
    cop_config = {
      'EnforcedStyle' => 'always'
    }

    subject(:cop) { described_class.new(config) }

    let(:cop_config) { cop_config }

    it 'registers an offense for "or"' 


    it 'registers an offense for "and"' 


    it 'accepts ||' 


    it 'accepts &&' 


    it 'auto-corrects "and" with &&' 


    it 'auto-corrects "or" with ||' 


    it 'auto-corrects "or" with || inside def' 


    it 'autocorrects "or" with an assignment on the left' 


    it 'autocorrects "or" with an assignment on the right' 


    it 'autocorrects "and" with an assignment and return on either side' 


    it 'autocorrects "and" with an Enumerable accessor on either side' 


    it 'warns on short-circuit (and)' 


    it 'also warns on non short-circuit (and)' 


    it 'also warns on non short-circuit (and) (unless)' 


    it 'warns on short-circuit (or)' 


    it 'also warns on non short-circuit (or)' 


    it 'also warns on non short-circuit (or) (unless)' 


    it 'also warns on while (or)' 


    it 'also warns on until (or)' 


    it 'auto-corrects "or" with || in method calls' 


    it 'auto-corrects "or" with || in method calls (2)' 


    it 'auto-corrects "or" with || in method calls (3)' 


    it 'auto-corrects "or" with || in method calls (4)' 


    it 'auto-corrects "or" with || and doesn\'t add extra parentheses' 


    it 'auto-corrects "or" with || and adds parentheses to expr' 


    it 'auto-corrects "and" with && in method calls' 


    it 'auto-corrects "and" with && in method calls (2)' 


    it 'auto-corrects "and" with && in method calls (3)' 


    it 'auto-corrects "and" with && in method calls (4)' 


    it 'auto-corrects "and" with && and doesn\'t add extra parentheses' 


    it 'auto-corrects "and" with && and adds parentheses to expr' 


    context 'with !obj.method arg on right' do
      it 'autocorrects "and" with && and adds parens' 

    end

    context 'with !obj.method arg on left' do
      it 'autocorrects "and" with && and adds parens' 

    end

    context 'with obj.method = arg on left' do
      it 'autocorrects "and" with && and adds parens' 

    end

    context 'with obj.method= arg on left' do
      it 'autocorrects "and" with && and adds parens' 

    end

    context 'with predicate method with arg without space on right' do
      it 'autocorrects "or" with || and adds parens' 


      it 'autocorrects "and" with && and adds parens' 

    end

    context 'with two predicate methods with args without spaces on right' do
      it 'autocorrects "or" with || and adds parens' 


      it 'autocorrects "and" with && and adds parens' 

    end

    context 'with one predicate method without space on right and another ' \
            'method' do
      it 'autocorrects "or" with || and adds parens' 


      it 'autocorrects "and" with && and adds parens' 

    end

    context 'with `not` expression on right' do
      it 'autocorrects "and" with && and adds parens' 

    end

    context 'with `not` expression on left' do
      it 'autocorrects "and" with && and adds parens' 

    end

    context 'with !variable on left' do
      it "doesn't crash and burn" 

    end

    context 'within a nested begin node' do
      # regression test; see GH issue 2531
      it 'autocorrects "and" with && and adds parens' 

    end

    context 'when left hand side is a comparison method' do
      # Regression: https://github.com/rubocop-hq/rubocop/issues/4451
      it 'autocorrects "and" with && and adds parens' 

    end

    context 'within a nested begin node with one child only' do
      # regression test; see GH issue 2531
      it 'autocorrects "and" with && and adds parens' 

    end

    context 'with a file which contains __FILE__' do
      let(:source) do
        <<-RUBY.strip_indent
          APP_ROOT = Pathname.new File.expand_path('../../', __FILE__)
          system('bundle check') or system!('bundle install')
        RUBY
      end

      # regression test; see GH issue 2609
      it 'autocorrects "or" with ||' 

    end
  end
end

