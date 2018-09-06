require 'concurrent/edge/promises'
require 'thread'


RSpec.describe 'Concurrent::Promises' do

  include Concurrent::Promises::FactoryMethods

  describe 'chain_resolvable' do
    it 'event' 


    it 'future' 

  end

  describe '.future' do
    it 'executes' 


    it 'executes with args' 

  end

  describe '.delay' do

    def behaves_as_delay(delay, value)
      expect(delay.resolved?).to eq false
      expect(delay.value!).to eq value
    end

    specify do
      behaves_as_delay delay { 1 + 1 }, 2
      behaves_as_delay fulfilled_future(1).delay.then { |v| v + 1 }, 2
      behaves_as_delay delay(1) { |a| a + 1 }, 2
      behaves_as_delay fulfilled_future(1).delay.then { |v| v + 1 }, 2
    end
  end

  describe '.schedule' do
    it 'scheduled execution' 


    it 'scheduled execution in graph' 


  end

  describe '.event' do
    specify do
      resolvable_event = resolvable_event()
      one              = resolvable_event.chain(1) { |arg| arg }
      join             = zip(resolvable_event).chain { 1 }
      expect(one.resolved?).to be false
      resolvable_event.resolve
      expect(one.value!).to eq 1
      expect(join.wait.resolved?).to be true
    end
  end

  describe '.future without block' do
    specify do
      resolvable_future = resolvable_future()
      one               = resolvable_future.then(&:succ)
      join              = zip_futures(resolvable_future).then { |v| v }
      expect(one.resolved?).to be false
      resolvable_future.fulfill 0
      expect(one.value!).to eq 1
      expect(join.wait!.resolved?).to be true
      expect(join.value!).to eq 0
    end
  end

  describe '.any_resolved' do
    it 'continues on first result' 

  end

  describe '.any_fulfilled' do
    it 'continues on first result' 

  end

  describe '.zip' do
    it 'waits for all results' 


    context 'when a future raises an error' do

      let(:a_future) { future { raise 'error' } }

      it 'raises a concurrent error' 


      context 'when deeply nested' do
        it 'raises the original error' 

      end
    end
  end

  describe '.zip_events' do
    it 'waits for all and returns event' 

  end

  describe '.rejected_future' do
    it 'raises the correct error when passed an unraised error' 

  end

  describe 'Future' do
    it 'has sync and async callbacks' 


    [:wait, :wait!, :value, :value!, :reason, :result].each do |method_with_timeout|
      it "#{ method_with_timeout } supports setting timeout" 

    end


    it 'chains' 


    it 'constructs promise like tree' 


    it 'allows graphs' 


    describe '#flat' do
      it 'returns value of inner future' 


      it 'propagates rejection of inner future' 


      it 'it propagates rejection of the future which was suppose to provide inner future' 


      it 'rejects if inner value is not a future' 


      it 'propagates requests for values to delayed futures' 

    end

    it 'resolves future when Exception raised' 


    it 'runs' 

  end

  describe 'interoperability' do
    it 'with actor', if: !defined?(JRUBY_VERSION) do
      actor = Concurrent::Actor::Utils::AdHoc.spawn :doubler do
        -> v { v * 2 }
      end

      expect(future { 2 }.
          then_ask(actor).
          then { |v| v + 2 }.
          value!).to eq 6
    end

    it 'with channel' 

  end

  describe 'Cancellation', edge: true do
    specify do
      source, token = Concurrent::Cancellation.create

      futures = Array.new(2) { future(token) { |t| t.loop_until_canceled { Thread.pass }; :done } }

      source.cancel
      futures.each do |future|
        expect(future.value!).to eq :done
      end
    end

    specify do
      source, token = Concurrent::Cancellation.create
      source.cancel
      expect(token.canceled?).to be_truthy

      cancellable_branch = Concurrent::Promises.delay { 1 }
      expect((cancellable_branch | token.to_event).value).to be_nil
      expect(cancellable_branch.resolved?).to be_falsey
    end

    specify do
      source, token = Concurrent::Cancellation.create

      cancellable_branch = Concurrent::Promises.delay { 1 }
      expect(any_resolved_future(cancellable_branch, token.to_event).value).to eq 1
      expect(cancellable_branch.resolved?).to be_truthy
    end

    specify do
      source, token = Concurrent::Cancellation.create(
          Concurrent::Promises.resolvable_future, false, nil, err = StandardError.new('Cancelled'))
      source.cancel
      expect(token.canceled?).to be_truthy

      cancellable_branch = Concurrent::Promises.delay { 1 }
      expect((cancellable_branch | token.to_future).reason).to eq err
      expect(cancellable_branch.resolved?).to be_falsey
    end
  end

  describe 'Throttling' do
    specify do
      limit    = 4
      throttle = Concurrent::Throttle.new limit
      counter  = Concurrent::AtomicFixnum.new
      testing  = -> *args do
        counter.increment
        sleep rand * 0.02 + 0.02
        # returns less then 3 since it's throttled
        v = counter.decrement + 1
        v
      end

      expect(Concurrent::Promises.zip(
          *20.times.map do |i|
            throttle.throttled_future_chain { |trigger| trigger.then(throttle, &testing) }
          end).value!.all? { |v| v <= limit }).to be_truthy

      expect(Concurrent::Promises.zip(
          *20.times.map do |i|
            throttle.throttled_future(throttle, &testing)
          end).value!.all? { |v| v <= limit }).to be_truthy

      expect(Concurrent::Promises.zip(
          *20.times.map do |i|
            Concurrent::Promises.
                fulfilled_future(i).
                throttled_by(throttle) { |trigger| trigger.then(throttle, &testing) }
          end).value!.all? { |v| v <= limit }).to be_truthy

      expect(Concurrent::Promises.zip(
          *20.times.map do |i|
            Concurrent::Promises.
                fulfilled_future(i).
                then_throttled_by(throttle, throttle, &testing)
          end).value!.all? { |v| v <= limit }).to be_truthy
    end
  end

  describe 'Promises::Channel' do
    specify do
      channel = Concurrent::Promises::Channel.new 1

      pushed1 = channel.push 1
      expect(pushed1.resolved?).to be_truthy
      expect(pushed1.value!).to eq 1

      pushed2 = channel.push 2
      expect(pushed2.resolved?).to be_falsey

      popped = channel.pop
      expect(pushed1.value!).to eq 1
      expect(pushed2.resolved?).to be_truthy
      expect(pushed2.value!).to eq 2
      expect(popped.value!).to eq 1

      popped = channel.pop
      expect(popped.value!).to eq 2

      popped = channel.pop
      expect(popped.resolved?).to be_falsey

      pushed3 = channel.push 3
      expect(popped.value!).to eq 3
      expect(pushed3.resolved?).to be_truthy
      expect(pushed3.value!).to eq 3
    end

    specify do
      ch1 = Concurrent::Promises::Channel.new
      ch2 = Concurrent::Promises::Channel.new
      ch3 = Concurrent::Promises::Channel.new

      add = -> do
        (ch1.pop & ch2.pop).then do |a, b|
          if a == :done && b == :done
            :done
          else
            ch3.push a + b
            add.call
          end
        end
      end

      ch1.push 1
      ch2.push 2
      ch1.push 'a'
      ch2.push 'b'
      ch1.push nil
      ch2.push true

      result = Concurrent::Promises.future(&add).run.result
      expect(result[0..1]).to eq [false, nil]
      expect(result[2]).to be_a_kind_of(NoMethodError)
      expect(ch3.pop.value!).to eq 3
      expect(ch3.pop.value!).to eq 'ab'

      ch1.push 1
      ch2.push 2
      ch1.push 'a'
      ch2.push 'b'
      ch1.push :done
      ch2.push :done

      expect(Concurrent::Promises.future(&add).run.result).to eq [true, :done, nil]
      expect(ch3.pop.value!).to eq 3
      expect(ch3.pop.value!).to eq 'ab'
    end
  end
end

RSpec.describe Concurrent::ProcessingActor do
  specify do
    actor = Concurrent::ProcessingActor.act do |the_actor|
      the_actor.receive.then do |message|
        # the actor ends with message
        message
      end
    end #

    actor.tell! :a_message
    expect(actor.termination.value!).to eq :a_message

    def count(actor, count)
      # the block passed to receive is called when the actor receives the message
      actor.receive.then do |number_or_command, answer|
        # code which is evaluated after the number is received
        case number_or_command
        when :done
          # this will become the result (final value) of the actor
          count
        when :count
          # reply the current count
          answer.fulfill count
          # continue running
          count(actor, count)
        when Integer
          # this will call count again to set up what to do on next message, based on new state `count + numer`
          count(actor, count + number_or_command)
        end
      end
      # evaluation of count ends immediately
      # code which is evaluated before the number is received, should be empty
    end

    counter = Concurrent::ProcessingActor.act { |a| count a, 0 }
    expect(counter.tell!(2).ask(:count).value!).to eq 2
    expect(counter.tell!(3).tell!(:done).termination.value!).to eq 5

    add_once_actor = Concurrent::ProcessingActor.act do |the_actor|
      the_actor.receive.then do |(a, b), answer|
        result = a + b
        answer.fulfill result
        # terminate with result value
        result
      end
    end

    expect(add_once_actor.ask([1, 2]).value!).to eq 3
    expect(add_once_actor.ask(%w(ab cd)).reason).to be_a_kind_of RuntimeError
    expect(add_once_actor.termination.value!).to eq 3

    def pair_adder(actor)
      (actor.receive & actor.receive).then do |(value1, answer1), (value2, answer2)|
        result = value1 + value2
        answer1.fulfill result if answer1
        answer2.fulfill result if answer2
        pair_adder actor
      end
    end

    pair_adder = Concurrent::ProcessingActor.act { |a| pair_adder a }

    expect(pair_adder.tell!(3).ask(2).value!).to eq 5
    expect((pair_adder.ask('a') & pair_adder.ask('b')).value!).to eq %w[ab ab]
    expect((pair_adder.ask('a') | pair_adder.ask('b')).value!).to eq 'ab'
  end
end

