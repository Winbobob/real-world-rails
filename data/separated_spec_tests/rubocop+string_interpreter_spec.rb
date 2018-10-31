# frozen_string_literal: true

RSpec.describe RuboCop::StringInterpreter do
  describe '.interpret' do
    shared_examples 'simple escape' do |escaped|
      it "handles #{escaped}" 

    end

    it 'handles hex' 


    it 'handles octal' 


    it 'handles unicode' 


    it 'handles extended unicode' 


    it_behaves_like 'simple escape', '\\\\a'
    it_behaves_like 'simple escape', '\\\\b'
    it_behaves_like 'simple escape', '\\\\e'
    it_behaves_like 'simple escape', '\\\\f'
    it_behaves_like 'simple escape', '\\\\n'
    it_behaves_like 'simple escape', '\\\\r'
    it_behaves_like 'simple escape', '\\\\s'
    it_behaves_like 'simple escape', '\\\\t'
    it_behaves_like 'simple escape', '\\\\v'
    it_behaves_like 'simple escape', '\\\\n'
  end
end

