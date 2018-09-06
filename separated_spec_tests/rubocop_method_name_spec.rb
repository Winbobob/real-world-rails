# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Naming::MethodName, :config do
  subject(:cop) { described_class.new(config) }

  shared_examples 'never accepted' do |enforced_style|
    it 'registers an offense for mixed snake case and camel case' 


    it 'registers an offense for capitalized camel case' 


    it 'registers an offense for singleton upper case method without ' \
       'corresponding class' do
      expect_offense(<<-RUBY.strip_indent)
        module Sequel
          def self.Model(source)
                   ^^^^^ Use #{enforced_style} for method names.
          end
        end
      RUBY
    end
  end

  shared_examples 'always accepted' do
    it 'accepts one line methods' 


    it 'accepts operator definitions' 


    it 'accepts unary operator definitions' 


    %w[class module].each do |kind|
      it "accepts class emitter method in a #{kind}" 


      it "accepts class emitter method in a #{kind}, even when it is " \
         'defined inside another method' do
        expect_no_offenses(<<-RUBY.strip_indent)
          module DPN
            module Flow
              module BaseFlow
                class Start
                end
                def self.included(base)
                  def base.Start(aws_env, *args)
                  end
                end
              end
            end
          end
        RUBY
      end
    end
  end

  context 'when configured for snake_case' do
    let(:cop_config) { { 'EnforcedStyle' => 'snake_case' } }

    it 'registers an offense for camel case in instance method name' 


    it 'registers an offense for opposite + correct' 


    it 'registers an offense for camel case in singleton method name' 


    it 'accepts snake case in names' 


    it 'registers an offense for singleton camelCase method within class' 


    include_examples 'never accepted',  'snake_case'
    include_examples 'always accepted', 'snake_case'
  end

  context 'when configured for camelCase' do
    let(:cop_config) { { 'EnforcedStyle' => 'camelCase' } }

    it 'accepts camel case in instance method name' 


    it 'accepts camel case in singleton method name' 


    it 'registers an offense for snake case in names' 


    it 'registers an offense for correct + opposite' 


    it 'registers an offense for singleton snake_case method within class' 


    include_examples 'always accepted', 'camelCase'
    include_examples 'never accepted',  'camelCase'
  end
end

