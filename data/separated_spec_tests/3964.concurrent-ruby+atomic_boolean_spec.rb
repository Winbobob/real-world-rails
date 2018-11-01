RSpec.shared_examples :atomic_boolean do

  describe 'construction' do

    it 'sets the initial value' 


    it 'defaults the initial value to false' 


    it 'evaluates the truthiness of a true value' 


    it 'evaluates the truthiness of a false value' 

  end

  describe '#value' do

    it 'returns the current value' 

  end

  describe '#value=' do

    it 'sets the #value to the given `Boolean`' 


    it 'returns the new value' 


    it 'evaluates the truthiness of a true value' 


    it 'evaluates the truthiness of a false value' 

  end

  describe '#true?' do

    specify { expect(described_class.new(true).true?).to be true }

    specify { expect(described_class.new(false).true?).to be false }
  end

  describe '#false?' do

    specify { expect(described_class.new(true).false?).to be false }

    specify { expect(described_class.new(false).false?).to be true }
  end

  describe '#make_true' do

    it 'makes a false value true and returns true' 


    it 'keeps a true value true and returns false' 

  end

  describe '#make_false' do

    it 'makes a true value false and returns true' 


    it 'keeps a false value false and returns false' 

  end
end

module Concurrent

  RSpec.describe MutexAtomicBoolean do

    it_should_behave_like :atomic_boolean

    context 'instance methods' do

      before(:each) do
        expect(subject).to receive(:synchronize).with(no_args).and_return(true)
      end

      specify 'value is synchronized' do
        subject.value
      end

      specify 'value= is synchronized' do
        subject.value = 10
      end

      specify 'true? is synchronized' do
        subject.true?
      end

      specify 'false? is synchronized' do
        subject.false?
      end

      specify 'make_true is synchronized' do
        subject.make_true
      end

      specify 'make_false is synchronized' do
        subject.make_false
      end
    end
  end

  if defined? Concurrent::CAtomicBoolean

    RSpec.describe CAtomicBoolean do
      it_should_behave_like :atomic_boolean
    end
  end

  if Concurrent.on_jruby?

    RSpec.describe JavaAtomicBoolean do
      it_should_behave_like :atomic_boolean
    end
  end

  RSpec.describe AtomicBoolean do
    if RUBY_ENGINE != 'ruby'
      it 'does not load the C extension' 

    end

    if Concurrent.on_jruby?
      it 'inherits from JavaAtomicBoolean' 

    elsif defined? Concurrent::CAtomicBoolean
      it 'inherits from CAtomicBoolean' 

    else
      it 'inherits from MutexAtomicBoolean' 

    end

    describe '#to_s and #inspect' do
      it 'includes the value' 

    end
  end
end

