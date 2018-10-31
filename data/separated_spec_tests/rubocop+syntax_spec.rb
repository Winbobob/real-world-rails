# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::Syntax do
  let(:options) { nil }
  let(:ruby_version) { 2.4 }
  let(:path) { 'test.rb' }
  let(:processed_source) do
    RuboCop::ProcessedSource.new(source, ruby_version, path)
  end

  describe '.offenses_from_processed_source' do
    let(:offenses) do
      described_class.offenses_from_processed_source(processed_source,
                                                     nil, options)
    end

    context 'with a diagnostic error' do
      let(:source) { '(' }

      it 'returns an offense' 


      context 'with --display-cop-names option' do
        let(:options) { { display_cop_names: true } }

        it 'returns an offense with cop name' 

      end
    end

    context 'with a parser error' do
      let(:source) { <<-RUBY }
        # \xf9
      RUBY

      it 'returns an offense' 


      context 'with --display-cop-names option' do
        let(:options) { { display_cop_names: true } }

        it 'returns an offense with cop name' 

      end
    end
  end
end

