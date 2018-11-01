RSpec.shared_examples 'exchanger method with indefinite timeout' do

  before(:each) do
    subject # ensure proper initialization
  end

  it 'blocks indefinitely' 


  it 'receives the other value' 


  it 'can be reused' 

end

RSpec.shared_examples 'exchanger method with finite timeout' do

  it 'blocks until timeout' 


  it 'receives the other value' 


  it 'can be reused' 

end

RSpec.shared_examples 'exchanger method cross-thread interactions' do

  it 'when first, waits for a second' 


  it 'allows multiple firsts to cancel if necessary', notravis: true do
    first_value   = nil
    second_value  = nil
    cancels       = 3
    cancel_latch  = Concurrent::CountDownLatch.new(cancels)
    success_latch = Concurrent::CountDownLatch.new(1)

    threads = cancels.times.collect do
      in_thread do
        begin
          first_value = subject.send(method_name, :foo, 0.1)
        rescue Concurrent::TimeoutError
          # suppress
        ensure
          cancel_latch.count_down
        end
      end
    end

    threads.each { |t| t.join(1) }
    cancel_latch.wait(1)

    t1 = in_thread do
      first_value = subject.send(method_name, :bar, 1)
      success_latch.count_down
    end
    t1.join(0.1)

    second_value = subject.send(method_name, :baz, 0)
    success_latch.wait(1)

    expect(get_value(first_value)).to eq :baz
    expect(get_value(second_value)).to eq :bar
  end
end

RSpec.shared_examples :exchanger do

  context '#exchange' do
    let!(:method_name) { :exchange }

    def get_value(result)
      result
    end

    it_behaves_like 'exchanger method with indefinite timeout'
    it_behaves_like 'exchanger method with finite timeout'
    it_behaves_like 'exchanger method cross-thread interactions'
  end

  context '#exchange!' do
    let!(:method_name) { :exchange! }

    def get_value(result)
      result
    end

    it_behaves_like 'exchanger method with indefinite timeout'
    it_behaves_like 'exchanger method with finite timeout'
    it_behaves_like 'exchanger method cross-thread interactions'
  end

  context '#try_exchange' do
    let!(:method_name) { :try_exchange }

    def get_value(result)
      result.value
    end

    it_behaves_like 'exchanger method with indefinite timeout'
    it_behaves_like 'exchanger method with finite timeout'
    it_behaves_like 'exchanger method cross-thread interactions'
  end
end

module Concurrent

  RSpec.describe RubyExchanger do

    it_behaves_like :exchanger

    if Concurrent.on_cruby?

      specify 'stress test', notravis: true do
        thread_count   = 100
        exchange_count = 100
        latch          = Concurrent::CountDownLatch.new(thread_count)

        good = Concurrent::AtomicFixnum.new(0)
        bad  = Concurrent::AtomicFixnum.new(0)
        ugly = Concurrent::AtomicFixnum.new(0)

        thread_count.times.collect do |i|
          in_thread do
            exchange_count.times do |j|
              begin
                result = subject.exchange!(i, 1)
                result == i ? ugly.up : good.up
              rescue Concurrent::TimeoutError
                bad.up
              end
            end
            latch.count_down
          end
        end

        latch.wait

        puts "Good: #{good.value}, Bad (timeout): #{bad.value}, Ugly: #{ugly.value}"
        expect(good.value + bad.value + ugly.value).to eq thread_count * exchange_count
        expect(ugly.value).to eq 0
      end
    end
  end

  if defined? JavaExchanger
    RSpec.describe JavaExchanger do
      it_behaves_like :exchanger
    end
  end

  RSpec.describe Exchanger do

    context 'class hierarchy' do

      if Concurrent.on_jruby?
        it 'inherits from JavaExchanger' 

      else
        it 'inherits from RubyExchanger' 

      end
    end
  end
end

