unless Concurrent.on_jruby?

  # NOTE: These tests depend heavily on the private/undocumented
  # `ThreadLocalVar#value_for` method. This method does not, and cannot work
  # on JRuby at this time. Therefore, these tests cannot be run successfully on
  # JRuby. The initial implementation used a variation of `ThreadLocalVar`
  # which was pure-Ruby on all platforms and exhibited behavior that allowed
  # these tests to work. Functionality on JRuby was verified at that time. So
  # long as `ReentrantReadWriteLock` is not changed (with respect to
  # `ThreadLocalVar`) we can safely assume proper functionality on JRuby.

  require 'timeout'

  module Concurrent

    BaseMatcher = RSpec::Matchers::BuiltIn::BaseMatcher
    RRWL = ReentrantReadWriteLock # no way I'm typing that 50 times

    # ****************************************************************
    # First some custom matchers to make our tests all nice and pretty
    # ****************************************************************

    class HoldLock
      def initialize(lock)
        @lock = lock
      end

      def for_read
        HoldReadLock.new(@lock)
      end

      def for_write
        HoldWriteLock.new(@lock)
      end

      def for_both
        HoldBoth.new(@lock)
      end
    end

    class HoldReadLock < BaseMatcher
      def match(lock, thread)
        ((lock.instance_eval { @Counter.value } & RRWL::MAX_READERS) != 0) &&
          ((lock.instance_eval { @HeldCount.send(:value_for, thread) } & RRWL::READ_LOCK_MASK) > 0)
      end
    end

    class HoldWriteLock < BaseMatcher
      def match(lock, thread)
        ((lock.instance_eval { @Counter.value } & RRWL::RUNNING_WRITER) != 0) &&
          ((lock.instance_eval { @HeldCount.send(:value_for, thread) } & RRWL::WRITE_LOCK_MASK) > 0)
      end
    end

    class HoldBoth < BaseMatcher
      def match(lock, thread)
        HoldReadLock.new(lock).matches?(thread) && HoldWriteLock.new(lock).matches?(thread)
      end
    end

    class BeFree < BaseMatcher
      MASK = RRWL::MAX_READERS + RRWL::RUNNING_WRITER

      def matches?(lock)
        (lock.instance_eval { @Counter.value } & MASK) == 0
      end

      def failure_message
        "expected lock to be free"
      end
    end

    # *******************************************************

    RSpec.describe ReentrantReadWriteLock do

      let(:lock) { RRWL.new }

      def hold(lock)
        HoldLock.new(lock)
      end

      def be_free
        BeFree.new
      end

      def wait_up_to(secs, &condition)
        _end = Time.now + secs
        while !condition.call && Time.now < _end
          sleep(0.001)
        end
      end

      context "read lock" do

        it "allows other read locks to be acquired at the same time" 


        it "can be acquired more than once" 


        it "can be acquired while holding a write lock" 


        it "can be upgraded to a write lock" 


        it "cannot be released when not held" 


        it "cannot be released more times than it was taken" 


        it "wakes up waiting writers when the last read lock is released" 

      end

      context "write lock" do
        it "cannot be acquired when another thread holds a write lock" 


        it "cannot be acquired when another thread holds a read lock" 


        it "can be acquired more than once" 


        it "can be acquired while holding a read lock" 


        it "can be downgraded to a read lock" 


        it "cannot be released when not held" 


        it "cannot be released more times than it was taken" 


        it "wakes up waiting readers when the write lock is released", notravis: true do
          latch1,latch2 = CountDownLatch.new,CountDownLatch.new
          good = AtomicFixnum.new(0)
          threads = [
            in_thread { lock.acquire_write_lock; latch1.count_down; latch2.wait; lock.release_write_lock },
            in_thread { latch1.wait; lock.acquire_read_lock; good.update { |n| n+1 }},
            in_thread { latch1.wait; lock.acquire_read_lock; good.update { |n| n+1 }},
            in_thread { latch1.wait; lock.acquire_read_lock; good.update { |n| n+1 }}
          ]
          wait_up_to(0.2) { threads[3].status == 'sleep' }
          # The last 3 threads should be waiting to acquire read locks now...
          # TODO (pitr-ch 15-Oct-2016): https://travis-ci.org/ruby-concurrency/concurrent-ruby/jobs/166777543
          (1..3).each { |n| expect(threads[n].status).to eql "sleep" }
          (1..3).each { |n| expect(threads[n]).not_to hold(lock).for_read }
          # Throw latch2 and the writer will wake up and release its write lock...
          latch2.count_down
          wait_up_to(0.2) { good.value == 3 }
          (1..3).each { |n| expect(threads[n]).to hold(lock).for_read }
        end

        it "wakes up waiting writers when the write lock is released" 

      end

      context "#with_read_lock" do

        it "acquires read block before yielding, then releases it" 


        it "releases read lock if an exception is raised in block" 

      end

      context "#with_write_lock" do

        it "acquires write block before yielding, then releases it" 


        it "releases write lock if an exception is raised in block" 

      end

      context "#try_read_lock" do

        it "returns false immediately if read lock cannot be obtained" 


        it "acquires read lock and returns true if it can do so without blocking" 


        it "can acquire a read lock if a read lock is already held" 


        it "can acquire a read lock if a write lock is already held" 

      end

      context "#try_write_lock" do

        it "returns false immediately if write lock cannot be obtained" 


        it "acquires write lock and returns true if it can do so without blocking" 


        it "can acquire a write lock if a read lock is already held" 


        it "can acquire a write lock if a write lock is already held" 

      end

      it "can survive a torture test" 

    end
  end
end

