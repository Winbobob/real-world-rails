RSpec.shared_examples :semaphore do
  let(:semaphore) { described_class.new(3) }

  describe '#initialize' do
    it 'raises an exception if the initial count is not an integer' 


    context 'when initializing with 0' do
      let(:semaphore) { described_class.new(0) }

      it do
        expect(semaphore).to_not be nil
      end
    end

    context 'when initializing with -1' do
      let(:semaphore) { described_class.new(-1) }

      it do
        semaphore.release
        expect(semaphore.available_permits).to eq 0
      end
    end
  end

  describe '#acquire' do
    context 'permits available' do
      it 'should return true immediately' 

    end

    context 'not enough permits available' do
      it 'should block thread until permits are available' 

    end

    context 'when acquiring negative permits' do
      it do
        expect {
          semaphore.acquire(-1)
        }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#drain_permits' do
    it 'drains all available permits' 


    it 'drains nothing in no permits are available' 

  end

  describe '#try_acquire' do
    context 'without timeout' do
      it 'acquires immediately if permits are available' 


      it 'returns false immediately in no permits are available' 


      context 'when trying to acquire negative permits' do
        it do
          expect {
            semaphore.try_acquire(-1)
          }.to raise_error(ArgumentError)
        end
      end
    end

    context 'with timeout' do
      it 'acquires immediately if permits are available' 


      it 'acquires when permits are available within timeout' 


      it 'returns false on timeout' 

    end
  end

  describe '#reduce_permits' do
    it 'raises ArgumentError if reducing by negative number' 


    it 'reduces permits below zero' 


    it 'reduces permits' 


    it 'reduces zero permits' 

  end

  describe '#release' do
    it 'increases the number of available permits by one' 


    context 'when a number of permits is specified' do
      it 'increases the number of available permits by the specified value' 


      context 'when permits is set to negative number' do
        it do
          expect {
            semaphore.release(-1)
          }.to raise_error(ArgumentError)
        end
      end
    end
  end
end

module Concurrent
  RSpec.describe MutexSemaphore do
    it_should_behave_like :semaphore
  end

  if Concurrent.on_jruby?
    RSpec.describe JavaSemaphore do
      it_should_behave_like :semaphore
    end
  end

  RSpec.describe Semaphore do
    if Concurrent.on_jruby?
      it 'inherits from JavaSemaphore' 

    else
      it 'inherits from MutexSemaphore' 

    end
  end
end

