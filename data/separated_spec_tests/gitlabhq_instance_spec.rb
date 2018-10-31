describe QA::Scenario::Test::Instance do
  subject do
    Class.new(described_class) do
      tags :rspec
    end
  end

  context '#perform' do
    let(:arguments) { spy('Runtime::Scenario') }
    let(:release) { spy('Runtime::Release') }
    let(:runner) { spy('Specs::Runner') }

    before do
      stub_const('QA::Runtime::Release', release)
      stub_const('QA::Runtime::Scenario', arguments)
      stub_const('QA::Specs::Runner', runner)

      allow(runner).to receive(:perform).and_yield(runner)
    end

    it 'sets an address of the subject' 


    context 'no paths' do
      it 'should call runner with default arguments' 

    end

    context 'specifying paths' do
      it 'should call runner with paths' 

    end
  end
end

