# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::Documentation do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new('Style/CommentAnnotation' => {
                          'Keywords' => %w[TODO FIXME OPTIMIZE HACK REVIEW]
                        })
  end

  it 'registers an offense for non-empty class' 


  it 'does not consider comment followed by empty line to be class ' \
     'documentation' do
    expect_offense(<<-RUBY.strip_indent)
      # Copyright 2014
      # Some company

      class My_Class
      ^^^^^ Missing top-level class documentation comment.
        def method
        end
      end
    RUBY
  end

  it 'registers an offense for non-namespace' 


  it 'registers an offense for empty module without documentation' 


  it 'accepts non-empty class with documentation' 


  it 'registers an offense for non-empty class with annotation comment' 


  it 'registers an offense for non-empty class with directive comment' 


  it 'registers offense for non-empty class with frozen string comment' 


  it 'registers an offense for non-empty class with encoding comment' 


  it 'accepts non-empty class with annotation comment followed by other ' \
     'comment' do
    expect_no_offenses(<<-RUBY.strip_indent)
      # OPTIMIZE: Make this faster.
      # Class comment.
      class My_Class
        def method
        end
      end
    RUBY
  end

  it 'accepts non-empty class with comment that ends with an annotation' 


  it 'accepts non-empty module with documentation' 


  it 'accepts empty class without documentation' 


  it 'accepts namespace module without documentation' 


  it 'accepts namespace class without documentation' 


  it 'accepts namespace class which defines constants' 


  it 'accepts namespace module which defines constants' 


  it 'does not raise an error for an implicit match conditional' 


  it 'registers an offense if the comment line contains code' 


  it 'registers an offense for compact-style nested module' 


  it 'registers an offense for compact-style nested class' 


  context 'sparse and trailing comments' do
    %w[class module].each do |keyword|
      it "ignores comments after #{keyword} node end" 


      it "ignores sparse comments inside #{keyword} node" 

    end
  end

  context 'with # :nodoc:' do
    %w[class module].each do |keyword|
      it "accepts non-namespace #{keyword} without documentation" 


      it "accepts compact-style nested #{keyword} without documentation" 


      it "registers an offense for nested #{keyword} without documentation" 


      context 'with `all` modifier' do
        it "accepts nested #{keyword} without documentation" 

      end
    end

    context 'on a subclass' do
      it 'accepts non-namespace subclass without documentation' 


      it 'registers an offense for nested subclass without documentation' 


      context 'with `all` modifier' do
        it 'accepts nested subclass without documentation' 

      end
    end
  end
end

