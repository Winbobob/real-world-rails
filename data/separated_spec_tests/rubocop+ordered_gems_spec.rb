# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Bundler::OrderedGems, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    {
      'TreatCommentsAsGroupSeparators' => treat_comments_as_group_separators,
      'Include' => nil
    }
  end
  let(:treat_comments_as_group_separators) { false }

  context 'When gems are alphabetically sorted' do
    it 'does not register any offenses' 

  end

  context 'when a gem is referenced from a variable' do
    it 'ignores the line' 


    it 'resets the sorting to a new block' 

  end

  context 'When gems are not alphabetically sorted' do
    let(:source) { <<-RUBY.strip_indent }
      gem 'rubocop'
      gem 'rspec'
    RUBY

    it 'registers an offense' 


    it 'autocorrects' 

  end

  context 'When each individual group of line is sorted' do
    it 'does not register any offenses' 

  end

  context 'When a gem declaration takes several lines' do
    let(:source) { <<-RUBY.strip_indent }
      gem 'rubocop',
          '0.1.1'
      gem 'rspec'
    RUBY

    it 'registers an offense' 


    it 'autocorrects' 

  end

  context 'When the gemfile is empty' do
    it 'does not register any offenses' 

  end

  context 'When each individual group of line is not sorted' do
    let(:source) { <<-RUBY.strip_indent }
        gem "d"
        gem "b"
        gem "e"
        gem "a"
        gem "c"

        gem "h"
        gem "g"
        gem "j"
        gem "f"
        gem "i"
    RUBY

    it 'registers some offenses' 


    it 'autocorrects' 

  end

  context 'When gem groups is separated by multiline comment' do
    let(:source) { <<-RUBY.strip_indent }
      # For code quality
      gem 'rubocop'
      # For
      # test
      gem 'rspec'
    RUBY

    context 'with TreatCommentsAsGroupSeparators: true' do
      let(:treat_comments_as_group_separators) { true }

      it 'accepts' 

    end

    context 'with TreatCommentsAsGroupSeparators: false' do
      it 'registers an offense' 


      it 'autocorrects' 

    end
  end

  context 'When gems have an inline comment, and not sorted' do
    let(:source) { <<-RUBY.strip_indent }
      gem 'rubocop' # For code quality
      gem 'pry'
      gem 'rspec'   # For test
    RUBY

    it 'registers an offense' 


    it 'autocorrects' 

  end

  context 'When gems are asciibetically sorted' do
    it 'does not register an offense' 

  end

  context 'When a gem that starts with a capital letter is sorted' do
    it 'does not register an offense' 

  end

  context 'When a gem that starts with a capital letter is not sorted' do
    let(:source) { <<-RUBY.strip_indent }
      gem 'Z'
      gem 'a'
    RUBY

    it 'registers an offense' 


    it 'autocorrects' 

  end

  context 'When there are duplicated gems in group' do
    let(:source) { <<-RUBY.strip_indent }
      gem 'a'

      group :development do
        gem 'b'
        gem 'c'
        gem 'b'
      end
    RUBY

    it 'registers an offense' 


    it 'autocorrects' 

  end
end

