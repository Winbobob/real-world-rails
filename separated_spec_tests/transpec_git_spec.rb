# coding: utf-8

require 'spec_helper'
require 'transpec/git'

module Transpec
  describe Git do
    include_context 'isolated environment'

    describe '.command_available?' do
      subject { Git.command_available? }

      context 'when git command is found in PATH' do
        it { should be_true }
      end

      context 'when git command is not found in PATH' do
        before { stub_const('Transpec::Git::GIT', 'non-existent-command') }
        it { should be_false }
      end
    end

    describe '.inside_of_repository?' do
      subject { Git.inside_of_repository? }

      context 'when git command is avaialable' do
        context 'and the current directory is inside of git repository' do
          include_context 'inside of git repository'
          it { should be_true }
        end

        context 'and the current directory is not inside of git repository' do
          it { should be_false }
        end
      end

      context 'when git command is not avaialable' do
        before { Git.stub(:command_available?).and_return(false) }

        it 'raises error' 

      end
    end

    describe '.clean?' do
      subject { Git.clean? }

      context 'when inside of git repository' do
        include_context 'inside of git repository'

        before do
          File.write('foo', 'This is a sample file')
          `git add .`
          `git commit -m 'Initial commit'`
        end

        context 'and there are no changes' do
          it { should be_true }
        end

        context 'and there is an untracked file' do
          before { File.write('bar', 'This is an untracked file') }
          it { should be_false }
        end

        context 'and there is a deleted file' do
          before { File.delete('foo') }
          it { should be_false }
        end

        context 'and there is a not staged change' do
          before { File.write('foo', 'This is modified content') }
          it { should be_false }
        end

        context 'and there is a staged change' do
          before do
            File.write('foo', 'This is modified content')
            `git add .`
          end

          it { should be_false }
        end
      end

      context 'when not inside of git repository' do
        it 'raises error' 

      end
    end

    describe '.write_commit_message' do
      let(:message) { 'This is the commit message.' }

      context 'when inside of standard git-dir (.git) repository' do
        include_context 'inside of git repository'

        context 'and the current working directory is the repository root' do
          it 'writes the message to .git/COMMIT_EDITMSG' 

        end

        context 'and the current working directory is not the repository root' do
          around do |example|
            Dir.mkdir('dir')
            Dir.chdir('dir') do
              example.run
            end
          end

          it 'writes the message to .git/COMMIT_EDITMSG in the repository root' 

        end

        it 'returns the commit message file path' 

      end

      context 'when inside of separated git-dir repository' do
        around do |example|
          Dir.mkdir('repo')
          Dir.chdir('repo') do
            `git init --separate-git-dir this-is-git-dir`
            example.run
          end
        end

        it 'writes the message to COMMIT_EDITMSG in the separated git-dir' 

      end

      context 'when not inside of git repository' do
        it 'raises error' 

      end
    end
  end
end

