describe QA::Scenario::Actable do
  subject do
    Class.new do
      include QA::Scenario::Actable

      attr_accessor :something

      def do_something(arg = nil)
        "some#{arg}"
      end
    end
  end

  describe '.act' do
    it 'provides means to run steps' 


    it 'supports passing variables' 


    it 'returns value from the last method' 

  end

  describe '.perform' do
    it 'makes it possible to pass binding' 

  end
end

