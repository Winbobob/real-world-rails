module RSpec::Core
  RSpec.describe OutputWrapper do
    let(:output) { StringIO.new }
    let(:wrapper) { OutputWrapper.new(output) }

    it 'redirects calls to the wrapped object' 


    describe '#output=' do
      let(:another_output) { StringIO.new }

      it 'changes the output stream' 

    end
  end
end

