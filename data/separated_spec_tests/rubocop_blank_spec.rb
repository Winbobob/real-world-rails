# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::Blank, :config do
  subject(:cop) { described_class.new(config) }

  shared_examples :offense do |source, correction, message|
    it 'registers an offense' 


    it 'auto-corrects' 

  end

  context 'NilOrEmpty set to true' do
    let(:cop_config) do
      { 'NilOrEmpty' => true }
    end

    it 'accepts checking nil?' 


    it 'accepts checking empty?' 


    it 'accepts checking nil? || empty? on different objects' 


    # Bug: https://github.com/bbatsov/rubocop/issues/4171
    it 'does not break when RHS of `or` is a naked falsiness check' 


    it 'does not break when LHS of `or` is a naked falsiness check' 


    # Bug: https://github.com/bbatsov/rubocop/issues/4814
    it 'does not break when LHS of `or` is a send node with an arugment' 


    context 'nil or empty' do
      it_behaves_like :offense, 'foo.nil? || foo.empty?',
                      'foo.blank?',
                      'Use `foo.blank?` instead of `foo.nil? || foo.empty?`.'
      it_behaves_like :offense, 'nil? || empty?',
                      'blank?',
                      'Use `blank?` instead of `nil? || empty?`.'
      it_behaves_like :offense, 'foo == nil || foo.empty?',
                      'foo.blank?',
                      'Use `foo.blank?` instead of `foo == nil || foo.empty?`.'
      it_behaves_like :offense, 'nil == foo || foo.empty?',
                      'foo.blank?',
                      'Use `foo.blank?` instead of `nil == foo || foo.empty?`.'
      it_behaves_like :offense, '!foo || foo.empty?',
                      'foo.blank?',
                      'Use `foo.blank?` instead of `!foo || foo.empty?`.'

      it_behaves_like :offense, 'foo.nil? || !!foo.empty?',
                      'foo.blank?',
                      'Use `foo.blank?` instead of `foo.nil? || !!foo.empty?`.'
      it_behaves_like :offense, 'foo == nil || !!foo.empty?',
                      'foo.blank?',
                      'Use `foo.blank?` instead of ' \
                      '`foo == nil || !!foo.empty?`.'
      it_behaves_like :offense, 'nil == foo || !!foo.empty?',
                      'foo.blank?',
                      'Use `foo.blank?` instead of ' \
                      '`nil == foo || !!foo.empty?`.'
    end

    context 'checking all variable types' do
      it_behaves_like :offense, 'foo.bar.nil? || foo.bar.empty?',
                      'foo.bar.blank?',
                      'Use `foo.bar.blank?` instead of ' \
                      '`foo.bar.nil? || foo.bar.empty?`.'
      it_behaves_like :offense, 'FOO.nil? || FOO.empty?',
                      'FOO.blank?',
                      'Use `FOO.blank?` instead of `FOO.nil? || FOO.empty?`.'
      it_behaves_like :offense, 'Foo.nil? || Foo.empty?',
                      'Foo.blank?',
                      'Use `Foo.blank?` instead of `Foo.nil? || Foo.empty?`.'
      it_behaves_like :offense, 'Foo::Bar.nil? || Foo::Bar.empty?',
                      'Foo::Bar.blank?',
                      'Use `Foo::Bar.blank?` instead of ' \
                      '`Foo::Bar.nil? || Foo::Bar.empty?`.'
      it_behaves_like :offense, '@foo.nil? || @foo.empty?',
                      '@foo.blank?',
                      'Use `@foo.blank?` instead of `@foo.nil? || @foo.empty?`.'
      it_behaves_like :offense, '$foo.nil? || $foo.empty?',
                      '$foo.blank?',
                      'Use `$foo.blank?` instead of `$foo.nil? || $foo.empty?`.'
      it_behaves_like :offense, '@@foo.nil? || @@foo.empty?',
                      '@@foo.blank?',
                      'Use `@@foo.blank?` instead of ' \
                      '`@@foo.nil? || @@foo.empty?`.'
      it_behaves_like :offense, 'foo[bar].nil? || foo[bar].empty?',
                      'foo[bar].blank?',
                      'Use `foo[bar].blank?` instead of ' \
                      '`foo[bar].nil? || foo[bar].empty?`.'
      it_behaves_like :offense, 'foo(bar).nil? || foo(bar).empty?',
                      'foo(bar).blank?',
                      'Use `foo(bar).blank?` instead of ' \
                      '`foo(bar).nil? || foo(bar).empty?`.'
    end
  end

  context 'NotPresent set to true' do
    let(:cop_config) do
      { 'NotPresent' => true }
    end

    it_behaves_like :offense, '!foo.present?',
                    'foo.blank?',
                    'Use `foo.blank?` instead of `!foo.present?`.'
    it_behaves_like :offense, 'not foo.present?',
                    'foo.blank?',
                    'Use `foo.blank?` instead of `not foo.present?`.'
    it_behaves_like :offense, '!present?',
                    'blank?',
                    'Use `blank?` instead of `!present?`.'
  end

  context 'UnlessPresent set to true' do
    let(:cop_config) do
      { 'UnlessPresent' => true }
    end

    it 'accepts modifier if present?' 


    it 'accepts modifier unless blank?' 


    it 'accepts normal if present?' 


    it 'accepts normal unless blank?' 


    it 'accepts elsif present?' 


    context 'modifier unless' do
      context 'with a receiver' do
        it 'registers an offense' 


        it 'auto-corrects' 

      end

      context 'without a receiver' do
        it 'registers an offense' 


        it 'auto-corrects' 

      end
    end

    context 'normal unless present?' do
      let(:source) do
        <<-RUBY.strip_indent
          unless foo.present?
            something
          end
        RUBY
      end

      it 'registers an offense' 


      it 'auto-corrects' 

    end

    context 'unless present? with an else' do
      let(:source) do
        <<-RUBY.strip_indent
          unless foo.present?
            something
          else
            something_else
          end
        RUBY
      end

      it 'registers an offense' 


      it 'auto-corrects' 

    end
  end

  context 'NilOrEmpty set to false' do
    let(:cop_config) do
      { 'NilOrEmpty' => false,
        'NotPresent' => true,
        'UnlessPresent' => true }
    end

    it 'accepts checking nil? || empty?' 

  end

  context 'NotPresent set to false' do
    let(:cop_config) do
      { 'NilOrEmpty' => true,
        'NotPresent' => false,
        'UnlessPresent' => true }
    end

    it 'accepts !present?' 

  end

  context 'UnlessPresent set to false' do
    let(:cop_config) do
      { 'NilOrEmpty' => true,
        'NotPresent' => true,
        'UnlessPresent' => false }
    end

    it 'accepts unless present?' 

  end
end

