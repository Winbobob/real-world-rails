# frozen_string_literal: true

require 'support/file_helper'
require 'rubocop/rake_task'

RSpec.describe RuboCop::RakeTask do
  include FileHelper

  before do
    Rake::Task.clear
  end

  after do
    Rake::Task.clear
  end

  describe 'defining tasks' do
    it 'creates a rubocop task and a rubocop auto_correct task' 


    it 'creates a named task and a named auto_correct task' 

  end

  describe 'running tasks' do
    before do
      $stdout = StringIO.new
      $stderr = StringIO.new
    end

    after do
      $stdout = STDOUT
      $stderr = STDERR
    end

    it 'runs with default options' 


    it 'runs with specified options if a block is given' 


    it 'allows nested arrays inside formatters, options, and requires' 


    it 'will not error when result is not 0 and fail_on_error is false' 


    it 'exits when result is not 0 and fail_on_error is true' 


    it 'uses the default formatter from .rubocop.yml if no formatter ' \
       'option is given', :isolated_environment do
      create_file('.rubocop.yml', <<-YAML.strip_indent)
        AllCops:
          DefaultFormatter: offenses
      YAML
      create_file('test.rb', '$:')

      described_class.new do |task|
        task.options = ['test.rb']
      end

      expect { Rake::Task['rubocop'].execute }.to raise_error(SystemExit)

      expect($stdout.string).to eq(<<-RESULT.strip_indent)
        Running RuboCop...

        1  Style/SpecialGlobalVars
        --
        1  Total

      RESULT
      expect($stderr.string.strip).to eq 'RuboCop failed!'
    end

    context 'auto_correct' do
      it 'runs with --auto-correct' 


      it 'runs with with the options that were passed to its parent task' 

    end
  end
end

