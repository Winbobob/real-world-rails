describe QA::Scenario::Test::Sanity::Selectors do
  let(:validator) { spy('validator') }

  before do
    stub_const('QA::Page::Validator', validator)
  end

  context 'when there are errors detected' do
    before do
      allow(validator).to receive(:errors).and_return(['some error'])
    end

    it 'outputs information about errors' 

  end

  context 'when there are no errors detected' do
    before do
      allow(validator).to receive(:errors).and_return([])
    end

    it 'processes pages module' 


    it 'triggers validation' 

  end
end

