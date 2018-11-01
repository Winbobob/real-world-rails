RSpec.describe RuboCop::Cop::RSpec::UnspecifiedException do
  subject(:cop) { described_class.new }

  context 'with raise_error matcher' do
    it 'detects the `unspecified_exception` offense' 


    it 'allows empty exception specification when not expecting an error' 


    it 'allows exception classes' 


    it 'allows exception messages' 


    it 'allows exception types with messages' 


    it 'allows exception matching regular expressions' 


    it 'allows exception types with matching regular expressions' 


    it 'allows classes with blocks with braces' 


    it 'allows classes with blocks with do/end' 


    it 'allows parameterized exceptions' 

  end

  context 'with raise_exception matcher' do
    it 'detects the `unspecified_exception` offense' 


    it 'allows empty exception specification when not expecting an error' 


    it 'allows exception classes' 


    it 'allows exception messages' 


    it 'allows exception types with messages' 


    it 'allows exception matching regular expressions' 


    it 'allows exception types with matching regular expressions' 


    it 'allows classes with blocks with braces' 


    it 'allows classes with blocks with do/end' 


    it 'allows parameterized exceptions' 

  end
end

