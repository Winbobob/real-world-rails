# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Commissioner do
  describe '#investigate' do
    let(:cop) do
      double(RuboCop::Cop, offenses: [], excluded_file?: false).as_null_object
    end
    let(:force) { double(RuboCop::Cop::Force).as_null_object }

    it 'returns all offenses found by the cops' 


    context 'when a cop has no interest in the file' do
      it 'returns all offenses except the ones of the cop' 

    end

    it 'traverses the AST and invoke cops specific callbacks' 


    it 'passes the input params to all cops/forces that implement their own' \
       ' #investigate method' do
      source = []
      processed_source = parse_source(source)
      expect(cop).to receive(:investigate).with(processed_source)
      expect(force).to receive(:investigate).with(processed_source)

      commissioner = described_class.new([cop], [force])

      commissioner.investigate(processed_source)
    end

    it 'stores all errors raised by the cops' 


    context 'when passed :raise_error option' do
      it 're-raises the exception received while processing' 

    end
  end
end

