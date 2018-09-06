require 'timeout'

module Concurrent

  RSpec.describe Synchronization do

    RSpec.shared_examples :attr_volatile do

      specify 'older writes are always visible' do
        # store              = BClass.new
        store.not_volatile = 0
        store.volatile     = 0

        t1 = Thread.new do
          Thread.abort_on_exception = true
          1000000000.times do |i|
            store.not_volatile = i
            store.volatile     = i
          end
        end

        t2 = Thread.new do
          10.times do
            volatile     = store.volatile
            not_volatile = store.not_volatile
            expect(not_volatile).to be >= volatile
            Thread.pass
          end
        end

        t2.join
        t1.kill
      end
    end

   describe Synchronization::Object do
      class AAClass < Synchronization::Object
      end

      class ABClass < AAClass
        safe_initialization!
      end

      class ACClass < ABClass
      end

      class ADClass < ACClass
        safe_initialization!
      end

      it 'does not ensure visibility when not needed' 


      it "does ensure visibility when specified" 


      it "does ensure visibility when specified in a parent" 


      it "does ensure visibility once when specified in child again" 


      # TODO (pitr 12-Sep-2015): give a whole gem a pass to find classes with final fields without using the convention and migrate
      Synchronization::Object.ensure_safe_initialization_when_final_fields_are_present

      class VolatileFieldClass < Synchronization::Object
        attr_volatile :volatile
        attr_accessor :not_volatile
      end

      let(:store) { VolatileFieldClass.new }
      it_should_behave_like :attr_volatile
   end

   describe Synchronization::LockableObject do

      class BClass < Synchronization::LockableObject
        safe_initialization!

        attr_volatile :volatile
        attr_accessor :not_volatile

        def initialize(value = nil)
          super()
          @Final = value
          ns_initialize
        end

        def final
          @Final
        end

        def count
          synchronize { @count += 1 }
        end

        def wait(timeout = nil)
          synchronize { ns_wait(timeout) }
        end

        public :synchronize

        private

        def ns_initialize
          @count = 0
        end
      end

      subject { BClass.new }

      describe '#wait' do

        it 'puts the current thread to sleep' 


        it 'allows the sleeping thread to be killed' 


        it 'releases the lock on the current object' 


        it 'can be called from within a #synchronize block' 

      end

      describe '#synchronize' do
        it 'allows only one thread to execute count' 

      end

      describe 'signaling' do
        pending 'for now pending, tested pretty well by Event'
      end

      specify 'final field always visible' do
        store = BClass.new 'asd'
        t1    = Thread.new { 1000000000.times { |i| store = BClass.new i.to_s } }
        t2    = Thread.new { 10.times { expect(store.final).not_to be_nil; Thread.pass } }
        t2.join
        t1.kill
      end

      let(:store) { BClass.new }
      it_should_behave_like :attr_volatile
   end

    describe 'Concurrent::Synchronization::Volatile module' do
      class BareClass
        include Synchronization::Volatile

        attr_volatile :volatile
        attr_accessor :not_volatile
      end

      let(:store) { BareClass.new }
      it_should_behave_like :attr_volatile
    end

    describe 'attr_atomic' do
      specify do
        a = Class.new(Synchronization::Object) do
          attr_atomic :a

          def initialize(*rest)
            super
            self.a = :a
          end
        end

        b = Class.new(a) do
          attr_atomic :b

          def initialize
            super
            self.b = :b
          end
        end

        instance = b.new
        expect(instance.a).to be == :a
        expect(instance.b).to be == :b
      end
    end

  end
end

