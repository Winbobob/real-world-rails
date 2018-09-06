require_relative 'ivar_shared'

module Concurrent

  RSpec.describe IVar do

    let!(:value) { 10 }

    let!(:fulfilled_value) { 10 }
    let(:rejected_reason) { StandardError.new('Boom!') }

    subject { IVar.new(value) }

    let(:pending_subject) do
      ivar = IVar.new
      Thread.new do
        sleep(0.1)
        ivar.set(fulfilled_value)
      end
      ivar
    end

    let(:fulfilled_subject) do
      IVar.new.set(fulfilled_value)
    end

    let(:rejected_subject) do
      IVar.new.fail(rejected_reason)
    end

    it_should_behave_like :ivar do
      subject{ IVar.new }

      def dereferenceable_subject(value, opts = {})
        IVar.new(value, opts)
      end

      def dereferenceable_observable(opts = {})
        IVar.new(NULL, opts)
      end

      def execute_dereferenceable(subject)
        subject.set('value')
      end

      def trigger_observable(observable)
        observable.set('value')
      end
    end

    context '#initialize' do

      it 'does not have to set an initial value' 


      it 'does not set an initial value if you pass NULL' 


      it 'can set an initial value' 


      it 'can set an initial value with a block' 


      it 'raises an exception if given both a value and a block' 

    end

    context 'observation' do

      let(:clazz) do
        Class.new do
          attr_reader :value
          attr_reader :reason
          attr_reader :count
          define_method(:update) do |time, value, reason|
            @count = @count.to_i + 1
            @value = value
            @reason = reason
          end
        end
      end

      let(:observer) { clazz.new }

      it 'notifies all observers on #set' 


      context 'deadlock avoidance' do

        def reentrant_observer(i)
          obs = Object.new
          obs.define_singleton_method(:update) do |time, value, reason|
            @value = i.value
          end
          obs.define_singleton_method(:value) { @value }
          obs
        end

        it 'should notify observers outside mutex lock' 


        it 'should notify a new observer added after fulfillment outside lock' 

      end
    end
  end
end

