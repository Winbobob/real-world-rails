require 'spec_helper'

describe WebMock::API do
  describe '#hash_including' do
    subject { klass.new.hash_including(args) }
    let(:args) { { data: :one } }

    context 'when mixed into a class that does not define `hash_including`' do
      let(:klass) do
        Class.new do
          include WebMock::API
        end
      end

      it 'uses WebMock::Matchers::HashIncludingMatcher' 


      #  by testing equality for HashIncludingMatcher (which stringifies the passed hash) we are
      #  testing HashIncludingMatcher.initialize behavior as well
      context "when args correspond to an hash" do
        it "creates 'HashIncludingMatcher'" 

      end

      context "when args are one or many keys" do
        subject {klass.new.hash_including(:foo, :bar)}
        let(:anything) { WebMock::Matchers::AnyArgMatcher.new(nil) }

        it "creates 'HashIncludingMatcher' with keys anythingized" 

      end

      context "when args are both keys and key/value pairs" do
        subject {klass.new.hash_including(:foo, :bar, data: :one)}
        let(:anything) { WebMock::Matchers::AnyArgMatcher.new(nil) }

        it "creates 'HashIncludingMatcher' with keys anythingized" 

      end

      context "when args are an empty hash" do
        subject {klass.new.hash_including({})}

        it "creates 'HashIncludingMatcher' with an empty hash" 

      end
    end


    context 'when mixed into a class with a parent that defines `hash_including`' do
      subject { klass.new.hash_including(*args) }
      let(:args) { %w(:foo, :bar, {:data => :one}) }
      let(:klass) do
        Class.new(
          Class.new do
            def hash_including(*args)
              args
            end
          end
        ) { include WebMock::API }
      end

      it 'uses super and passes the args untampered' 

    end
  end

  describe '#hash_excluding' do
    subject { klass.new.hash_excluding(args) }
    let(:args) { { data: :one } }

    context 'when mixed into a class that does not define `hash_including`' do
      let(:klass) do
        Class.new do
          include WebMock::API
        end
      end

      it 'uses WebMock::Matchers::HashIncludingMatcher' 


      #  by testing equality for HashIncludingMatcher (which stringifies the passed hash) we are
      #  testing HashIncludingMatcher.initialize behavior as well
      context 'when args correspond to an hash' do
        context 'creates "HashExcludingMatcher"' do
          it 'equals hash with similar key but different value' 


          it 'equals hash with similar value but different key' 


          it 'equals hash with defferent value and key' 


          it 'not equals with similar value and key' 

        end
      end

      context 'when args are one or many keys' do
        subject { klass.new.hash_excluding(:foo, :bar) }
        let(:anything) { WebMock::Matchers::AnyArgMatcher.new(nil) }

        it "creates 'HashExcludingMatcher' with keys anythingized" 

      end

      context 'when args are both keys and key/value pairs' do
        subject { klass.new.hash_excluding(:foo, :bar, data: :one) }
        let(:anything) { WebMock::Matchers::AnyArgMatcher.new(nil) }

        it 'creates "HashExcludingMatcher" with keys anythingized' 

      end

      context 'when args are an empty hash' do
        subject { klass.new.hash_excluding({}) }

        it 'creates "HashExcludingMatcher" with an empty hash' 

      end
    end

    context 'when mixed into a class with a parent that defines `hash_excluding`' do
      subject { klass.new.hash_excluding(*args) }
      let(:args) { %w(:foo, :bar, {:data => :one}) }
      let(:klass) do
        Class.new(
          Class.new do
            def hash_excluding(*args)
              args
            end
          end
        ) { include WebMock::API }
      end

      it 'uses super and passes the args untampered' 

    end
  end

  describe '#reset_executed_requests!' do
    subject {  WebMock::API.reset_executed_requests! }

    let(:request_signature) { WebMock::RequestSignature.new(:get, "www.example.com") }
    let(:request_pattern)   { WebMock::RequestPattern.new(:get, "www.example.com") }

    before do
      WebMock::RequestRegistry.instance.requested_signatures.put(request_signature)
    end

    it 'resets request registry counter' 

  end
end

