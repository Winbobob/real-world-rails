describe QA::Page::Validator do
  describe '#constants' do
    subject do
      described_class.new(QA::Page::Project)
    end

    it 'returns all constants that are module children' 

  end

  describe '#descendants' do
    subject do
      described_class.new(QA::Page::Project)
    end

    it 'recursively returns all descendants that are page objects' 


    it 'does not return modules that aggregate page objects' 

  end

  context 'when checking validation errors' do
    let(:view) { spy('view') }

    before do
      allow(QA::Page::Admin::Settings::Repository)
        .to receive(:views).and_return([view])
    end

    subject do
      described_class.new(QA::Page::Admin)
    end

    context 'when there are no validation errors' do
      before do
        allow(view).to receive(:errors).and_return([])
      end

      describe '#errors' do
        it 'does not return errors' 

      end

      describe '#validate!' do
        it 'does not raise error' 

      end
    end

    context 'when there are validation errors' do
      before do
        allow(view).to receive(:errors)
          .and_return(['some error', 'another error'])
      end

      describe '#errors' do
        it 'returns errors' 

      end

      describe '#validate!' do
        it 'raises validation error' 

      end
    end
  end
end
