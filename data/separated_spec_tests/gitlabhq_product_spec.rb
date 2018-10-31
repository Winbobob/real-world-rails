describe QA::Factory::Product do
  let(:factory) do
    QA::Factory::Base.new
  end

  let(:attributes) do
    { test: QA::Factory::Product::Attribute.new(:test, proc { 'returned' }) }
  end

  let(:product) { spy('product') }

  before do
    allow(QA::Factory::Base).to receive(:attributes).and_return(attributes)
  end

  describe '.populate!' do
    it 'returns a fabrication product and define factory attributes as its methods' 

  end

  describe '.visit!' do
    it 'makes it possible to visit fabrication product' 

  end
end

