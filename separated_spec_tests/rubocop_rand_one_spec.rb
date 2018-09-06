# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::RandOne do
  subject(:cop) { described_class.new }

  before { inspect_source(source) }

  shared_examples 'offenses' do |source|
    describe source do
      let(:source) { source }

      it 'registers an offense' 

    end
  end

  shared_examples 'no offense' do |source|
    describe source do
      let(:source) { source }

      it "doesn't register an offense" 

    end
  end

  it_behaves_like 'offenses', 'rand 1'
  it_behaves_like 'offenses', 'rand(-1)'
  it_behaves_like 'offenses', 'rand(1.0)'
  it_behaves_like 'offenses', 'rand(-1.0)'
  it_behaves_like 'no offense', 'rand'
  it_behaves_like 'no offense', 'rand(2)'
  it_behaves_like 'no offense', 'rand(-1..1)'

  it_behaves_like 'offenses', 'Kernel.rand(1)'
  it_behaves_like 'offenses', 'Kernel.rand(-1)'
  it_behaves_like 'offenses', 'Kernel.rand 1.0'
  it_behaves_like 'offenses', 'Kernel.rand(-1.0)'
  it_behaves_like 'no offense', 'Kernel.rand'
  it_behaves_like 'no offense', 'Kernel.rand 2'
  it_behaves_like 'no offense', 'Kernel.rand(-1..1)'
end

