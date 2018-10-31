# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::Present, :config do
  subject(:cop) { described_class.new(config) }

  shared_examples :offense do |source, correction, message|
    it 'registers an offense' 


    it 'auto-corrects' 

  end

  context 'NotNilAndNotEmpty set to true' do
    let(:cop_config) do
      { 'NotNilAndNotEmpty' => true,
        'NotBlank' => false,
        'UnlessBlank' => false }
    end

    it 'accepts checking nil?' 


    it 'accepts checking empty?' 


    it 'accepts checking nil? || empty? on different objects' 


    it 'accepts checking existence && not empty? on different objects' 


    it_behaves_like :offense, 'foo && !foo.empty?',
                    'foo.present?',
                    'Use `foo.present?` instead of `foo && !foo.empty?`.'
    it_behaves_like :offense, '!foo.nil? && !foo.empty?',
                    'foo.present?',
                    'Use `foo.present?` instead of `!foo.nil? && !foo.empty?`.'
    it_behaves_like :offense, '!nil? && !empty?',
                    'present?',
                    'Use `present?` instead of `!nil? && !empty?`.'
    it_behaves_like :offense, 'foo != nil && !foo.empty?',
                    'foo.present?',
                    'Use `foo.present?` instead of `foo != nil && !foo.empty?`.'
    it_behaves_like :offense, '!!foo && !foo.empty?',
                    'foo.present?',
                    'Use `foo.present?` instead of `!!foo && !foo.empty?`.'

    context 'checking all variable types' do
      it_behaves_like :offense, '!foo.nil? && !foo.empty?',
                      'foo.present?',
                      'Use `foo.present?` instead of ' \
                      '`!foo.nil? && !foo.empty?`.'
      it_behaves_like :offense, '!foo.bar.nil? && !foo.bar.empty?',
                      'foo.bar.present?',
                      'Use `foo.bar.present?` instead of ' \
                      '`!foo.bar.nil? && !foo.bar.empty?`.'
      it_behaves_like :offense, '!FOO.nil? && !FOO.empty?',
                      'FOO.present?',
                      'Use `FOO.present?` instead of ' \
                      '`!FOO.nil? && !FOO.empty?`.'
      it_behaves_like :offense, '!Foo.nil? && !Foo.empty?',
                      'Foo.present?',
                      'Use `Foo.present?` instead of ' \
                      '`!Foo.nil? && !Foo.empty?`.'
      it_behaves_like :offense, '!@foo.nil? && !@foo.empty?',
                      '@foo.present?',
                      'Use `@foo.present?` instead of ' \
                      '`!@foo.nil? && !@foo.empty?`.'
      it_behaves_like :offense, '!$foo.nil? && !$foo.empty?',
                      '$foo.present?',
                      'Use `$foo.present?` instead of ' \
                      '`!$foo.nil? && !$foo.empty?`.'
      it_behaves_like :offense, '!@@foo.nil? && !@@foo.empty?',
                      '@@foo.present?',
                      'Use `@@foo.present?` instead of ' \
                      '`!@@foo.nil? && !@@foo.empty?`.'
      it_behaves_like :offense, '!foo[bar].nil? && !foo[bar].empty?',
                      'foo[bar].present?',
                      'Use `foo[bar].present?` instead of ' \
                      '`!foo[bar].nil? && !foo[bar].empty?`.'
      it_behaves_like :offense, '!Foo::Bar.nil? && !Foo::Bar.empty?',
                      'Foo::Bar.present?',
                      'Use `Foo::Bar.present?` instead of ' \
                      '`!Foo::Bar.nil? && !Foo::Bar.empty?`.'
      it_behaves_like :offense, '!foo(bar).nil? && !foo(bar).empty?',
                      'foo(bar).present?',
                      'Use `foo(bar).present?` instead of ' \
                      '`!foo(bar).nil? && !foo(bar).empty?`.'
    end
  end

  context 'NotBlank set to true' do
    let(:cop_config) do
      { 'NotNilAndNotEmpty' => false,
        'NotBlank' => true,
        'UnlessBlank' => false }
    end

    it_behaves_like :offense, '!foo.blank?',
                    'foo.present?',
                    'Use `foo.present?` instead of `!foo.blank?`.'

    it_behaves_like :offense, 'not foo.blank?',
                    'foo.present?',
                    'Use `foo.present?` instead of `not foo.blank?`.'
    it_behaves_like :offense, '!blank?',
                    'present?',
                    'Use `present?` instead of `!blank?`.'
  end

  context 'UnlessBlank set to true' do
    let(:cop_config) do
      { 'NotNilAndNotEmpty' => false,
        'NotBlank' => false,
        'UnlessBlank' => true }
    end

    it 'accepts modifier if blank?' 


    it 'accepts modifier unless present?' 


    it 'accepts normal if blank?' 


    it 'accepts normal unless present?' 


    context 'unless blank?' do
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

      context 'normal unless blank?' do
        let(:source) do
          <<-RUBY.strip_indent
            unless foo.blank?
              something
            end
          RUBY
        end

        it 'registers an offense' 


        it 'auto-corrects' 

      end

      context 'unless blank? with an else' do
        let(:source) do
          <<-RUBY.strip_indent
            unless foo.blank?
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
  end

  context 'NotNilAndNotEmpty set to false' do
    let(:cop_config) do
      { 'NotNilAndNotEmpty' => false,
        'NotBlank' => true,
        'UnlessBlank' => true }
    end

    it 'accepts checking nil? || empty?' 

  end

  context 'NotBlank set to false' do
    let(:cop_config) do
      { 'NotNilAndNotEmpty' => true,
        'NotBlank' => false,
        'UnlessBlank' => true }
    end

    it 'accepts !...blank?' 

  end

  context 'UnlessBlank set to false' do
    let(:cop_config) do
      { 'NotNilAndNotEmpty' => true,
        'NotBlank' => true,
        'UnlessBlank' => false }
    end

    it 'accepts unless blank?' 

  end
end

