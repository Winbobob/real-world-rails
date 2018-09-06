require 'concurrent/actor'

module Concurrent
  module Actor
    AdHoc = Utils::AdHoc

    # FIXME better tests!

    RSpec.describe 'Concurrent::Actor', edge: true, if: !defined?(JRUBY_VERSION) do

      def terminate_actors(*actors)
        actors.each do |actor|
          unless actor.ask!(:terminated?)
            actor.ask!(:terminate!)
          end
        end
      end

      class Ping < Context
        def initialize(queue)
          @queue = queue
        end

        def on_message(message)
          case message
          when :child
            AdHoc.spawn!(:pong, @queue) { |queue| -> m { queue << m } }
          else
            @queue << message
            message
          end
        end
      end

      it 'forbids Immediate executor' 


      describe 'spawning' do
        describe 'Actor#spawn!' do
          behaviour = -> v { -> _ { v } }
          subjects  = { spawn:                 -> { Actor.spawn!(AdHoc, :ping, 'arg', &behaviour) },
                        context_spawn:         -> { AdHoc.spawn!(:ping, 'arg', &behaviour) },
                        spawn_by_hash:         -> { Actor.spawn!(class: AdHoc, name: :ping, args: ['arg'], &behaviour) },
                        context_spawn_by_hash: -> { AdHoc.spawn!(name: :ping, args: ['arg'], &behaviour) } }

          subjects.each do |desc, subject_definition|
            describe desc do
              subject(:actor, &subject_definition)
              after { terminate_actors actor }

              describe '#path' do
                subject { super().path }
                it { is_expected.to eq '/ping' }
              end

              describe '#parent' do
                subject { super().parent }
                it { is_expected.to eq Actor.root }
              end

              describe '#name' do
                subject { super().name }
                it { is_expected.to eq 'ping' }
              end
              it('executor should be global') { expect(subject.executor).to eq Concurrent.global_io_executor }

              describe '#reference' do
                subject { super().reference }
                it { is_expected.to eq subject }
              end
              it 'returns arg' 

            end
          end
        end

        it 'terminates on failed initialization' 


        it 'terminates on failed initialization and raises with spawn!' 


        it 'terminates on failed message processing' 

      end

      describe 'messaging' do
        subject { AdHoc.spawn!(:add) { c = 0; -> v { c = c + v } } }
        specify do
          subject.tell(1).tell(1)
          subject << 1 << 1
          expect(subject.ask(0).value!).to eq 4
        end
        after { terminate_actors subject }
      end

      describe 'children' do
        let(:parent) do
          AdHoc.spawn!(:parent) do
            -> message do
              if message == :child
                AdHoc.spawn!(:child) { -> _ { parent } }
              else
                children
              end
            end
          end
        end

        it 'has children set after a child is created' 

      end

      describe 'envelope' do
        subject { AdHoc.spawn!(:subject) { -> _ { envelope } } }
        specify do
          envelope = subject.ask!('a')
          expect(envelope).to be_a_kind_of Envelope
          expect(envelope.message).to eq 'a'
          expect(envelope.future).to be_resolved
          expect(envelope.future.value).to eq envelope
          expect(envelope.sender).to eq Thread.current
          terminate_actors subject
        end
      end

      describe 'termination' do
        subject do
          AdHoc.spawn!(:parent) do
            child = AdHoc.spawn!(:child) { -> v { v } }
            -> v { child }
          end
        end

        it 'terminates with all its children', buggy: true do
          child = subject.ask! :child
          expect(subject.ask!(:terminated?)).to be_falsey
          subject.ask(:terminate!).wait
          expect(subject.ask!(:terminated?)).to be_truthy
          expect(child.ask!(:terminated?)).to be_truthy

          terminate_actors subject, child
        end
      end

      describe 'dead letter routing' do
        it 'logs by deafault' 

      end

      describe 'message redirecting' do
        let(:parent) do
          AdHoc.spawn!(:parent) do
            child = AdHoc.spawn!(:child) { -> m { m+1 } }
            -> message do
              if message == :child
                child
              else
                redirect child
              end
            end
          end
        end

        it 'is evaluated by child' 

      end

      it 'links' 


      it 'links atomically' 


      describe 'pausing' do
        it 'pauses on error and resumes' 


        it 'pauses on error and resets' 


        it 'pauses on error and restarts' 


      end

      describe 'pool' do
        it 'supports asks', buggy: true do
          children = Queue.new
          pool     = Concurrent::Actor::Utils::Pool.spawn! 'pool', 5 do |index|
            worker = Concurrent::Actor::Utils::AdHoc.spawn! name: "worker-#{index}", supervised: true do
              lambda do |message|
                fail if message == :fail
                5 + message
              end
            end
            children.push worker
            worker
          end

          10.times { expect(pool.ask!(5)).to eq 10 }
          expect(pool.ask(:fail).reason).to be_kind_of RuntimeError
          expect(pool.ask!(5)).to eq 10
          expect(pool.ask!(:terminate!)).to be_truthy
          5.times { expect(children.pop.ask!(:terminated?)).to be_truthy }

          terminate_actors pool
        end
      end

    end
  end
end

