describe QA::Page::View do
  let(:element) do
    double('element', name: :something, pattern: /some element/)
  end

  subject { described_class.new('some/file.html', [element]) }

  describe '.evaluate' do
    it 'evaluates a block and returns a DSL object' 

  end

  describe '#pathname' do
    it 'returns an absolute and clean path to the view' 

  end

  describe '#errors' do
    context 'when view partial is present' do
      before do
        allow(subject.pathname).to receive(:readable?)
          .and_return(true)
      end

      context 'when pattern is found' do
        before do
          allow(File).to receive(:foreach)
            .and_yield('some element').once
          allow(element).to receive(:matches?)
            .with('some element').and_return(true)
        end

        it 'walks through the view and asserts on elements existence' 

      end

      context 'when pattern has not been found' do
        before do
          allow(File).to receive(:foreach)
            .and_yield('some element').once
          allow(element).to receive(:matches?)
            .with('some element').and_return(false)
        end

        it 'returns an array of errors related to missing elements' 

      end
    end

    context 'when view partial has not been found' do
      it 'returns an error when it is not able to find the partial' 

    end
  end
end

