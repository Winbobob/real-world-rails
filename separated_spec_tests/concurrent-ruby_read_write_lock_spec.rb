module Concurrent

  RSpec.describe ReadWriteLock do

    context '#write_locked?' do

      it 'returns true when the write lock is held' 


      it 'returns false when the write lock is not held' 


      it 'returns false when the write lock is not held but there are readers' 

    end

    context '#has_waiters?' do

      it 'returns false when no locks are held' 


      it 'returns false when there are readers but no writers' 


      it 'returns true when the write lock is held and there are waiting readers' 


      it 'returns true when the write lock is held and there are waiting writers' 

    end

    context '#with_read_lock' do

      it 'acquires the lock' 


      it 'returns the value of the block operation' 


      it 'releases the lock' 


      it 'raises an exception if no block is given' 


      it 'raises an exception if maximum lock limit is exceeded' 


      it 'releases the lock when an exception is raised' 

    end

    context '#with_write_lock' do

      it 'acquires the lock' 


      it 'returns the value of the block operation' 


      it 'releases the lock' 


      it 'raises an exception if no block is given' 


      it 'raises an exception if maximum lock limit is exceeded' 


      it 'releases the lock when an exception is raised' 

    end

    context '#acquire_read_lock' do

      it 'increments the lock count' 


      it 'waits for a running writer to finish' 


      it 'does not wait for any running readers' 


      it 'raises an exception if maximum lock limit is exceeded' 


      it 'returns true if the lock is acquired' 

    end

    context '#release_read_lock' do

      it 'decrements the counter' 


      it 'unblocks waiting writers' 


      it 'returns true if the lock is released' 


      it 'returns true if the lock was never set' 

    end

    context '#acquire_write_lock' do

      it 'increments the lock count' 


      it 'waits for a running writer to finish' 


      it 'waits for a running reader to finish' 


      it 'raises an exception if maximum lock limit is exceeded' 


      it 'returns true if the lock is acquired' 

    end

    context '#release_write_lock' do

      it 'decrements the counter' 


      it 'unblocks waiting readers' 


      it 'unblocks waiting writers' 


      it 'returns true if the lock is released' 


      it 'returns true if the lock was never set' 

    end
  end
end

