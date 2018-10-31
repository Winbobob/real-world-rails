require 'spec_helper'

describe Gitlab::QuickActions::Extractor do
  let(:definitions) do
    Class.new do
      include Gitlab::QuickActions::Dsl

      command(:reopen, :open) { }
      command(:assign) { }
      command(:labels) { }
      command(:power) { }
      command(:noop_command)
      substitution(:substitution) { 'foo' }
      substitution :shrug do |comment|
        "#{comment} SHRUG"
      end
    end.command_definitions
  end

  let(:extractor) { described_class.new(definitions) }

  shared_examples 'command with no argument' do
    it 'extracts command' 

  end

  shared_examples 'command with a single argument' do
    it 'extracts command' 

  end

  shared_examples 'command with multiple arguments' do
    it 'extracts command' 

  end

  describe '#extract_commands' do
    describe 'command with no argument' do
      context 'at the start of content' do
        it_behaves_like 'command with no argument' do
          let(:original_msg) { "/reopen\nworld" }
          let(:final_msg) { "world" }
        end
      end

      context 'in the middle of content' do
        it_behaves_like 'command with no argument' do
          let(:original_msg) { "hello\n/reopen\nworld" }
          let(:final_msg) { "hello\nworld" }
        end
      end

      context 'in the middle of a line' do
        it 'does not extract command' 

      end

      context 'at the end of content' do
        it_behaves_like 'command with no argument' do
          let(:original_msg) { "hello\n/reopen" }
          let(:final_msg) { "hello" }
        end
      end
    end

    describe 'command with a single argument' do
      context 'at the start of content' do
        it_behaves_like 'command with a single argument' do
          let(:original_msg) { "/assign @joe\nworld" }
          let(:final_msg) { "world" }
        end

        it 'allows slash in command arguments' 

      end

      context 'in the middle of content' do
        it_behaves_like 'command with a single argument' do
          let(:original_msg) { "hello\n/assign @joe\nworld" }
          let(:final_msg) { "hello\nworld" }
        end
      end

      context 'in the middle of a line' do
        it 'does not extract command' 

      end

      context 'at the end of content' do
        it_behaves_like 'command with a single argument' do
          let(:original_msg) { "hello\n/assign @joe" }
          let(:final_msg) { "hello" }
        end
      end

      context 'when argument is not separated with a space' do
        it 'does not extract command' 

      end
    end

    describe 'command with multiple arguments' do
      context 'at the start of content' do
        it_behaves_like 'command with multiple arguments' do
          let(:original_msg) { %(/labels ~foo ~"bar baz" label\nworld) }
          let(:final_msg) { "world" }
        end
      end

      context 'in the middle of content' do
        it_behaves_like 'command with multiple arguments' do
          let(:original_msg) { %(hello\n/labels ~foo ~"bar baz" label\nworld) }
          let(:final_msg) { "hello\nworld" }
        end
      end

      context 'in the middle of a line' do
        it 'does not extract command' 

      end

      context 'at the end of content' do
        it_behaves_like 'command with multiple arguments' do
          let(:original_msg) { %(hello\n/labels ~foo ~"bar baz" label) }
          let(:final_msg) { "hello" }
        end
      end

      context 'when argument is not separated with a space' do
        it 'does not extract command' 

      end
    end

    it 'extracts command with multiple arguments and various prefixes' 


    it 'does not extract noop commands' 


    it 'extracts and performs substitution commands' 


    it 'extracts and performs substitution commands' 


    it 'extracts and performs substitution commands with comments' 


    it 'extracts multiple commands' 


    it 'does not alter original content if no command is found' 


    it 'does not extract commands inside a blockcode' 


    it 'does not extract commands inside a blockquote' 


    it 'does not extract commands inside a HTML tag' 

  end
end

