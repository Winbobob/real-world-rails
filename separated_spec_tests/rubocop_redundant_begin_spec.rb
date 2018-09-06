# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::RedundantBegin, :config do
  subject(:cop) { described_class.new(config) }

  it 'reports an offense for single line def with redundant begin block' 


  it 'reports an offense for def with redundant begin block' 


  it 'reports an offense for defs with redundant begin block' 


  it 'accepts a def with required begin block' 


  it 'accepts a defs with required begin block' 


  it 'accepts a def with a begin block after a statement' 


  it 'auto-corrects source separated by newlines ' \
     'by removing redundant begin blocks' do
    src = <<-RUBY.strip_margin('|')
      |  def func
      |    begin
      |      foo
      |      bar
      |    rescue
      |      baz
      |    end
      |  end
    RUBY
    result_src = ['  def func',
                  '    ',
                  '      foo',
                  '      bar',
                  '    rescue',
                  '      baz',
                  '    ',
                  '  end',
                  ''].join("\n")
    new_source = autocorrect_source(src)
    expect(new_source).to eq(result_src)
  end

  it 'auto-corrects source separated by semicolons ' \
     'by removing redundant begin blocks' do
    src = '  def func; begin; x; y; rescue; z end end'
    result_src = '  def func; ; x; y; rescue; z  end'
    new_source = autocorrect_source(src)
    expect(new_source).to eq(result_src)
  end

  it "doesn't modify spacing when auto-correcting" 


  it 'auto-corrects when there are trailing comments' 


  context '< Ruby 2.5', :ruby24 do
    it 'accepts a do-end block with a begin-end' 

  end

  context '>= ruby 2.5', :ruby25 do
    it 'registers an offense for a do-end block with redundant begin-end' 


    it 'accepts a {} block with a begin-end' 


    it 'accepts a block with a begin block after a statement' 

  end
end

