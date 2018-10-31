# coding: utf-8

require 'spec_helper'
require 'transpec/commit_message'
require 'transpec/report'
require 'transpec/record'
require 'transpec/rspec_version'

module Transpec
  describe CommitMessage do
    subject(:commit_message) { CommitMessage.new(report, rspec_version, cli_args) }
    let(:report) { Report.new }
    let(:rspec_version) { RSpecVersion.new('2.99.0.beta1') }
    let(:cli_args) { ['--force', '--rspec-command', 'bundle exec rspec'] }

    before do
      report.records << Record.new('obj.stub(:message)', 'allow(obj).to receive(:message)')
      report.records << Record.new('obj.should', 'expect(obj).to')
      report.records << Record.new('obj.should', 'expect(obj).to')
    end

    describe '#to_s' do
      it 'wraps lines within 72 characters except URLs' 


      let(:lines) { commit_message.to_s.lines.to_a }

      describe 'first line' do
        it 'has concise summary' 

      end

      describe 'second line' do
        it 'has blank line' 

      end

      let(:body_lines) { lines[2..-1] }

      describe 'body' do
        it 'has Transpec description at the beginning' 


        it 'has blank line after the preface' 


        it 'has conversion summary' 


        it 'has blank line after the summary' 


        it 'has the URL at the last line' 

      end
    end
  end
end

