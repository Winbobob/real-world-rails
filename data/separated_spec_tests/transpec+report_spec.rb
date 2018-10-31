# coding: utf-8

require 'spec_helper'
require 'transpec/report'
require 'transpec/record'
require 'transpec/syntax'

module Transpec
  describe Report do
    subject(:report) { Report.new }

    before do
      options = { annotation: double('annotation') }
      report.records << Record.new('obj.stub(:message)', 'allow(obj).to receive(:message)', options)
      report.records << Record.new('obj.should', 'expect(obj).to')
      report.records << Record.new('obj.should', 'expect(obj).to', options)
      report.records << Record.new(nil, 'RSpec.configure { |c| c.infer_spec_type_from_file_location! }')
      report.conversion_errors << ContextError.new('#should', '#expect', double('range'))
    end

    describe '#unique_record_counts' do
      subject(:unique_record_counts) { report.unique_record_counts }

      it 'returns counts for unique records' 


      it 'returns hash with record as key and count as value' 


      it 'is sorted by count in descending order' 

    end

    describe '#summary' do
      it 'returns summary string' 


      context 'when :separate_by_blank_line option is enabled' do
        it 'separates conversion entries by blank line' 

      end

      context 'when :bullet option is specified' do
        it 'adds the bullet for each conversion entry' 

      end
    end

    describe '#stats' do
      it 'returns stats string' 

    end

    describe '#<<' do
      subject(:concated_report) { report << another_report }

      let(:another_report) do
        report = Report.new
        report.records << Record.new('obj.stub(:message)', 'allow(obj).to receive(:message)')
        report.conversion_errors << ContextError.new('#should', '#expect', double('range'))
        report.conversion_errors << ContextError.new('#stub', '#allow', double('range'))
        report.file_errors << double('file error')
        report
      end

      it 'returns the receiver' 


      it 'concats records' 


      it 'concats conversion errors' 


      it 'concats file errors' 

    end
  end
end

