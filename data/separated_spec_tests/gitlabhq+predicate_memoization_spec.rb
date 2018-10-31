require 'spec_helper'
require 'rubocop'
require 'rubocop/rspec/support'
require_relative '../../../../rubocop/cop/gitlab/predicate_memoization'

describe RuboCop::Cop::Gitlab::PredicateMemoization do
  include CopHelper

  subject(:cop) { described_class.new }

  shared_examples('registering offense') do |options|
    let(:offending_lines) { options[:offending_lines] }

    it 'registers an offense when a predicate method is memoizing via ivar' 

  end

  shared_examples('not registering offense') do
    it 'does not register offenses' 

  end

  context 'when source is a predicate method memoizing via ivar' do
    it_behaves_like 'registering offense', offending_lines: [3] do
      let(:source) do
        <<~RUBY
          class C
            def really?
              @really ||= true
            end
          end
        RUBY
      end
    end

    it_behaves_like 'registering offense', offending_lines: [4] do
      let(:source) do
        <<~RUBY
          class C
            def really?
              value = true
              @really ||= value
            end
          end
        RUBY
      end
    end
  end

  context 'when source is a predicate method using ivar with assignment' do
    it_behaves_like 'not registering offense' do
      let(:source) do
        <<~RUBY
          class C
            def really?
              @really = true
            end
          end
        RUBY
      end
    end
  end

  context 'when source is a predicate method using local with ||=' do
    it_behaves_like 'not registering offense' do
      let(:source) do
        <<~RUBY
          class C
            def really?
              really ||= true
            end
          end
        RUBY
      end
    end
  end

  context 'when source is a regular method memoizing via ivar' do
    it_behaves_like 'not registering offense' do
      let(:source) do
        <<~RUBY
          class C
            def really
              @really ||= true
            end
          end
        RUBY
      end
    end
  end
end

