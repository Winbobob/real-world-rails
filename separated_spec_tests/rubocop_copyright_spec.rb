# frozen_string_literal: true

def expect_copyright_offense(cop, source)
  inspect_source(source)
  expect(cop.offenses.size).to eq(1)
end

RSpec.describe RuboCop::Cop::Style::Copyright, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'Notice' => 'Copyright (\(c\) )?2015 Acme Inc' } }

  it 'does not register an offense when the notice is present' 


  it 'does not register an offense when the notice is not the first comment' 


  it 'does not register an offense when the notice is in a block comment' 


  context 'when the copyright notice is missing' do
    let(:source) { <<-RUBY.strip_indent }
      # test
      # test2
      names = Array.new
      names << 'James'
    RUBY

    it 'adds an offense' 


    it 'correctly autocorrects the source code' 


    it 'fails to autocorrect when the AutocorrectNotice does ' \
       'not match the Notice pattern' do
      cop_config['AutocorrectNotice'] = '# Copyleft (c) 2015 Acme Inc.'
      expect do
        autocorrect_source(source)
      end.to raise_error(RuboCop::Warning)
    end

    it 'fails to autocorrect if no AutocorrectNotice is given' 

  end

  context 'when the copyright notice comes after any code' do
    let(:source) { <<-RUBY.strip_indent }
      # test2
      names = Array.new
      # Copyright (c) 2015 Acme Inc.
      names << 'James'
    RUBY

    it 'adds an offense' 


    it 'correctly autocorrects the source code' 

  end

  context 'when the source code file is empty' do
    let(:source) { '' }

    it 'adds an offense' 


    it 'correctly autocorrects the source code' 

  end

  context 'when the copyright notice is missing and ' \
          'the source code file starts with a shebang' do
    let(:source) { <<-RUBY.strip_indent }
      #!/usr/bin/env ruby
      names = Array.new
      names << 'James'
    RUBY

    it 'adds an offense' 


    it 'correctly autocorrects the source code' 

  end

  context 'when the copyright notice is missing and ' \
          'the source code file starts with an encoding comment' do
    let(:source) { <<-RUBY.strip_indent }
      # encoding: utf-8
      names = Array.new
      names << 'James'
    RUBY

    it 'adds an offense' 


    it 'correctly autocorrects the source code' 

  end

  context 'when the copyright notice is missing and ' \
          'the source code file starts with shebang and ' \
          'an encoding comment' do
    let(:source) { <<-RUBY.strip_indent }
      #!/usr/bin/env ruby
      # encoding: utf-8
      names = Array.new
      names << 'James'
    RUBY

    it 'adds an offense' 


    it 'correctly autocorrects the source code' 

  end
end

