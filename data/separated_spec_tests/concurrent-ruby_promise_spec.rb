require_relative 'ivar_shared'
require_relative 'thread_arguments_shared'

module Concurrent

  RSpec.describe Promise do

    let!(:value) { 10 }
    let(:executor) { SimpleExecutorService.new }

    let(:empty_root) { Promise.new(executor: executor){ nil } }
    let!(:fulfilled_value) { 10 }
    let!(:rejected_reason) { StandardError.new('mojo jojo') }

    let(:pending_subject) do
      executor = Concurrent::SingleThreadExecutor.new
      executor.post{ sleep(5) }
      Promise.execute(executor: executor){ fulfilled_value }
    end

    let(:fulfilled_subject) do
      Promise.new(executor: :immediate){ fulfilled_value }.execute
    end

    let(:rejected_subject) do
      Promise.new(executor: :immediate){ raise rejected_reason }.execute
    end

    it_should_behave_like :ivar do
      subject{ Promise.new(executor: :immediate){ value } }

      def dereferenceable_subject(value, opts = {})
        opts = opts.merge(executor: executor)
        Promise.new(opts){ value }.execute.tap{ sleep(0.1) }
      end

      def dereferenceable_observable(opts = {})
        opts = opts.merge(executor: executor)
        Promise.new(opts){ 'value' }
      end

      def execute_dereferenceable(subject)
        subject.execute
        sleep(0.1)
      end

      def trigger_observable(observable)
        observable.execute
        sleep(0.1)
      end
    end

    it_should_behave_like :thread_arguments do

      def get_ivar_from_no_args
        Concurrent::Promise.execute{|*args| args }
      end

      def get_ivar_from_args(opts)
        Concurrent::Promise.execute(opts){|*args| args }
      end
    end

    context 'initializers' do
      describe '.fulfill' do

        subject { Promise.fulfill(10) }

        it 'should return a Promise' 


        it 'should return a fulfilled Promise' 


        it 'should return a Promise with set value' 

      end

      describe '.reject' do

        let(:reason) { ArgumentError.new }
        subject { Promise.reject(reason) }

        it 'should return a Promise' 


        it 'should return a rejected Promise' 


        it 'should return a Promise with set reason' 

      end

      describe '.new' do
        it 'should return an unscheduled Promise' 

      end

      describe '.execute' do
        it 'creates a new Promise' 


        it 'passes the block to the new Promise' 


        it 'calls #execute on the new Promise' 

      end
    end

    context '#execute' do

      context 'unscheduled' do

        it 'sets the promise to :pending' 


        it 'posts the block given in construction' 

      end

      context 'pending' do

        it 'sets the promise to :pending' 


        it 'does not post again' 

      end

      describe 'with children' do

        let(:start_latch) { CountDownLatch.new(4) }
        let(:end_latch) { CountDownLatch.new(1) }
        let(:root) { Promise.new(executor: executor){ start_latch.count_down; end_latch.wait(5) } }
        let(:c1) { root.then { start_latch.count_down; end_latch.wait(5) } }
        let(:c2) { root.then { start_latch.count_down; end_latch.wait(5) } }
        let(:c2_1) { c2.then { start_latch.count_down; end_latch.wait(5) } }

        context 'when called on the root' do
          it 'should set all promises to :pending' 

        end

        context 'when called on a child' do
          it 'should set all promises to :pending' 

        end
      end
    end

    describe '#then' do

      it 'returns a new promise when a block is passed' 


      it 'returns a new promise when a rescuer is passed' 


      it 'returns a new promise when a block and rescuer are passed' 


      it 'returns a new promise when a block, rescuer and executor are passed' 

      it 'should have block or rescuers' 


      context 'unscheduled' do

        let(:p1) { Promise.new(executor: executor){nil} }
        let(:child) { p1.then{} }

        it 'returns a new promise' 


        it 'returns an unscheduled promise' 

      end

      context 'pending' do

        let(:child) { pending_subject.then{} }

        it 'returns a new promise' 


        it 'returns a pending promise' 

      end

      context 'fulfilled' do
        it 'returns a new Promise' 


        it 'notifies fulfillment to new child' 

      end

      context 'rejected' do
        it 'returns a new Promise when :rejected' 


        it 'notifies rejection to new child' 

      end

      it 'can be called more than once' 

    end

    describe 'on_success' do
      it 'should have a block' 


      it 'returns a new promise' 

    end

    context '#rescue' do

      it 'returns a new promise' 

    end

    describe '#flat_map' do

      it 'returns a promise' 


      it 'succeeds if both promises succeed' 


      it 'fails if the left promise fails' 


      it 'fails if the right promise fails' 


      it 'fails if the generating block fails' 


    end

    describe '#zip' do
      let(:promise1) { Promise.new(executor: :immediate) { 1 } }
      let(:promise2) { Promise.new(executor: :immediate) { 2 } }
      let(:promise3) { Promise.new(executor: :immediate) { [3] } }

      it 'executes the returned Promise by default' 


      it 'executes the returned Promise when execute is true' 


      it 'does not execute the returned Promise when execute is false' 


      it 'allows setting executor for Promise chain' 


      it 'yields the results as an array' 


      it 'fails if one component fails' 


      it 'preserves ordering of the executed promises' 

    end

    describe '.zip' do
      let(:promise1) { Promise.new(executor: :immediate) { 1 } }
      let(:promise2) { Promise.new(executor: :immediate) { 2 } }
      let(:promise3) { Promise.new(executor: :immediate) { [3] } }

      it 'executes the returned Promise by default' 


      it 'executes the returned Promise when execute is true' 


      it 'does not execute the returned Promise when execute is false' 


      it 'allows setting executor for Promise chain' 


      it 'yields the results as an array' 


      it 'fails if one component fails' 


      it 'preserves ordering of the executed promises' 

    end

    describe 'aggregators' do

      let(:promise1) { Promise.new(executor: :immediate) { 1 } }
      let(:promise2) { Promise.new(executor: :immediate) { 2 } }
      let(:promise3) { Promise.new(executor: :immediate) { [3] } }

      describe '.all?' do

        it 'returns a new Promise' 


        it 'does not execute the returned Promise' 


        it 'executes the #then condition when all components succeed' 


        it 'executes the #then condition when no promises are given' 


        it 'executes the #rescue handler if even one component fails' 

      end

      describe '.any?' do

        it 'returns a new Promise' 


        it 'does not execute the returned Promise' 


        it 'executes the #then condition when any components succeed' 


        it 'executes the #then condition when no promises are given' 


        it 'executes the #rescue handler if all componenst fail' 

      end
    end

    context 'fulfillment' do

      context '#set' do

        it '#can only be called on the root promise' 


        it 'triggers children' 


        it 'can be called with a block' 

      end

      context '#fail' do

        it 'can only be called on the root promise' 


        it 'rejects children' 

      end

      it 'passes the result of each block to all its children' 


      it 'sets the promise value to the result if its block' 


      it 'sets the promise state to :fulfilled if the block completes' 


      it 'passes the last result through when a promise has no block' 


      it 'uses result as fulfillment value when a promise has no block' 


      it 'can manage long chain' 

    end

    context 'rejection' do

      it 'passes the reason to all its children' 


      it 'sets the promise value to the result if its block' 


      it 'sets the promise state to :rejected if the block completes' 


      it 'uses reason as rejection reason when a promise has no rescue callable' 


      it 'rejects on Exception' 


    end

    context 'aliases' do

      it 'aliases #realized? for #fulfilled?' 


      it 'aliases #deref for #value' 


      it 'aliases #catch for #rescue' 


      it 'aliases #on_error for #rescue' 

    end
  end
end

