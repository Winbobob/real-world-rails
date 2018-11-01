describe QA::Page::Base do
  describe 'page helpers' do
    it 'exposes helpful page helpers' 

  end

  describe '.view', 'DSL for defining view partials' do
    subject do
      Class.new(described_class) do
        view 'path/to/some/view.html.haml' do
          element :something, 'string pattern' # rubocop:disable QA/ElementWithPattern
          element :something_else, /regexp pattern/ # rubocop:disable QA/ElementWithPattern
        end

        view 'path/to/some/_partial.html.haml' do
          element :another_element, 'string pattern' # rubocop:disable QA/ElementWithPattern
        end
      end
    end

    it 'makes it possible to define page views' 


    it 'populates views objects with data about elements' 

  end

  describe '.errors' do
    let(:view) { double('view') }

    context 'when page has views and elements defined' do
      before do
        allow(described_class).to receive(:views)
          .and_return([view])

        allow(view).to receive(:errors).and_return(['some error'])
      end

      it 'iterates views composite and returns errors' 

    end

    context 'when page has no views and elements defined' do
      before do
        allow(described_class).to receive(:views).and_return([])
      end

      it 'appends an error about missing views / elements block' 

    end
  end
end

