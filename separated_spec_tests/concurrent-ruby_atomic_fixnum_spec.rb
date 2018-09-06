RSpec.shared_examples :atomic_fixnum do

  context 'construction' do

    it 'sets the initial value' 


    it 'defaults the initial value to zero' 


    it 'raises an exception if the initial value is not a Fixnum' 

  end

  context '#value' do

    it 'returns the current value' 

  end

  context '#value=' do

    it 'sets the #value to the given `Fixnum`' 


    it 'returns the new value' 


    it 'raises and exception if the value is not a `Fixnum`' 

  end

  context '#increment' do

    it 'increases the value by one when no argument is given' 


    it 'returns the new value when no argument is given' 


    it 'increases the value by the given argument' 


    it 'returns the new value the given argument' 


    it 'is aliased as #up' 

  end

  context '#decrement' do

    it 'decreases the value by one when no argument is given' 


    it 'returns the new value when no argument is given' 


    it 'decreases the value by the given argument' 


    it 'returns the new value the given argument' 


    it 'is aliased as #down' 

  end

  context '#compare_and_set' do

    it 'returns false if the value is not found' 


    it 'returns true if the value is found' 


    it 'sets if the value is found' 


    it 'does not set if the value is not found' 

  end

  context '#update' do

    it 'passes the current value to the block' 


    it 'atomically sets the value to the return value from the block' 


    it 'returns the new value' 

  end
end

module Concurrent

  RSpec.describe MutexAtomicFixnum do

    it_should_behave_like :atomic_fixnum

    context 'construction' do

      it 'raises an exception if the initial value is too big' 


      it 'raises an exception if the initial value is too small' 

    end

    context 'instance methods' do

      before(:each) do
        expect(subject).to receive(:synchronize).with(no_args).and_call_original
      end

      specify 'value is synchronized' do
        subject.value
      end

      specify 'value= is synchronized' do
        subject.value = 10
      end

      specify 'increment is synchronized' do
        subject.increment
      end

      specify 'decrement is synchronized' do
        subject.decrement
      end

      specify 'compare_and_set is synchronized' do
        subject.compare_and_set(14, 2)
      end
    end
  end

  if defined? Concurrent::CAtomicFixnum

    RSpec.describe CAtomicFixnum, ext: true do
      it_should_behave_like :atomic_fixnum
    end
  end

  if Concurrent.on_jruby?

    RSpec.describe JavaAtomicFixnum do
      it_should_behave_like :atomic_fixnum
    end
  end

  RSpec.describe AtomicFixnum do
    if RUBY_ENGINE != 'ruby'
      it 'does not load the C extension' 

    end

    if Concurrent.on_jruby?
      it 'inherits from JavaAtomicFixnum' 

    elsif defined? Concurrent::CAtomicFixnum
      it 'inherits from CAtomicFixnum', ext: true do
        expect(AtomicFixnum.ancestors).to include(CAtomicFixnum)
      end
    else
      it 'inherits from MutexAtomicFixnum' 

    end

    describe '#to_s and #inspect' do
      it 'includes the value' 

    end

  end
end

