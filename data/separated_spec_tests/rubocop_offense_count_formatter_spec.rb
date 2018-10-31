# frozen_string_literal: true

RSpec.describe RuboCop::Formatter::OffenseCountFormatter do
  subject(:formatter) { described_class.new(output) }

  let(:output) { StringIO.new }

  let(:files) do
    %w[lib/rubocop.rb spec/spec_helper.rb bin/rubocop].map do |path|
      File.expand_path(path)
    end
  end

  let(:finish) { formatter.file_finished(files.first, offenses) }

  describe '#file_finished' do
    before { formatter.started(files) }

    context 'when no offenses are detected' do
      let(:offenses) { [] }

      it 'does not add to offense_counts' 

    end

    context 'when any offenses are detected' do
      let(:offenses) { [double('offense', cop_name: 'OffendedCop')] }

      it 'increments the count for the cop in offense_counts' 

    end
  end

  describe '#report_summary' do
    context 'when an offense is detected' do
      let(:cop_counts) { { 'OffendedCop' => 1 } }

      it 'shows the cop and the offense count' 

    end
  end

  describe '#finished' do
    context 'when there are many offenses' do
      let(:offenses) do
        %w[CopB CopA CopC CopC].map { |c| double('offense', cop_name: c) }
      end

      before do
        allow(output).to receive(:tty?).and_return(false)
        formatter.started(files)
        finish
      end

      it 'sorts by offense count first and then by cop name' 

    end

    context 'when output tty is true' do
      let(:offenses) do
        %w[CopB CopA CopC CopC].map { |c| double('offense', cop_name: c) }
      end

      before do
        allow(output).to receive(:tty?).and_return(true)
        formatter.started(files)
        finish
      end

      it 'has a progresbar' 

    end
  end
end

