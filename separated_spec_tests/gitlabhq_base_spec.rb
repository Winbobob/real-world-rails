describe QA::Factory::Base do
  let(:factory) { spy('factory') }
  let(:product) { spy('product') }

  describe '.fabricate!' do
    subject { Class.new(described_class) }

    before do
      allow(QA::Factory::Product).to receive(:new).and_return(product)
      allow(QA::Factory::Product).to receive(:populate!).and_return(product)
    end

    it 'instantiates the factory and calls factory method' 


    it 'returns fabrication product' 


    it 'yields factory before calling factory method' 

  end

  describe '.dependency' do
    let(:dependency) { spy('dependency') }

    before do
      stub_const('Some::MyDependency', dependency)
    end

    subject do
      Class.new(described_class) do
        dependency Some::MyDependency, as: :mydep do |factory|
          factory.something!
        end
      end
    end

    it 'appends a new dependency and accessors' 


    it 'defines dependency accessors' 


    describe 'dependencies fabrication' do
      let(:dependency) { double('dependency') }
      let(:instance) { spy('instance') }

      subject do
        Class.new(described_class) do
          dependency Some::MyDependency, as: :mydep
        end
      end

      before do
        stub_const('Some::MyDependency', dependency)

        allow(subject).to receive(:new).and_return(instance)
        allow(instance).to receive(:mydep).and_return(nil)
        allow(QA::Factory::Product).to receive(:new)
        allow(QA::Factory::Product).to receive(:populate!)
      end

      it 'builds all dependencies first' 

    end
  end

  describe '.product' do
    subject do
      Class.new(described_class) do
        def fabricate!
          "any"
        end

        # Defined only to be stubbed
        def self.find_page
        end

        product :token do
          find_page.do_something_on_page!
          'resulting value'
        end
      end
    end

    it 'appends new product attribute' 


    describe 'populating fabrication product with data' do
      let(:page) { spy('page') }

      before do
        allow(factory).to receive(:class).and_return(subject)
        allow(QA::Factory::Product).to receive(:new).and_return(product)
        allow(product).to receive(:page).and_return(page)
        allow(subject).to receive(:find_page).and_return(page)
      end

      it 'populates product after fabrication' 

    end
  end
end

