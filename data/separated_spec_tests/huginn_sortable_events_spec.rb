require 'rails_helper'

describe SortableEvents do
  let(:agent_class) {
    Class.new(Agent) do
      include SortableEvents

      default_schedule 'never'

      def self.valid_type?(name)
        true
      end
    end
  }

  def new_agent(events_order = nil)
    options = {}
    options['events_order'] = events_order if events_order
    agent_class.new(name: 'test', options: options) { |agent|
      agent.user = users(:bob)
    }
  end

  describe 'validations' do
    let(:agent_class) {
      Class.new(Agent) do
        include SortableEvents

        default_schedule 'never'

        def self.valid_type?(name)
          true
        end
      end
    }

    def new_agent(events_order = nil)
      options = {}
      options['events_order'] = events_order if events_order
      agent_class.new(name: 'test', options: options) { |agent|
        agent.user = users(:bob)
      }
    end

    it 'should allow events_order to be unspecified, null or an empty array' 


    it 'should not allow events_order to be a non-array object' 


    it 'should not allow events_order to be an array containing unexpected objects' 


    it 'should allow events_order to be an array containing strings and valid tuples' 

  end

  describe 'sort_events' do
    let(:payloads) {
      [
        { 'title' => 'TitleA', 'score' => 4,  'updated_on' => '7 Jul 2015' },
        { 'title' => 'TitleB', 'score' => 2,  'updated_on' => '25 Jun 2014' },
        { 'title' => 'TitleD', 'score' => 10, 'updated_on' => '10 Jan 2015' },
        { 'title' => 'TitleC', 'score' => 10, 'updated_on' => '9 Feb 2015' },
      ]
    }

    let(:events) {
      payloads.map { |payload| Event.new(payload: payload) }
    }

    it 'should sort events by a given key' 


    it 'should sort events by multiple keys' 


    it 'should sort events by time' 


    it 'should sort events stably' 


    it 'should support _index_' 

  end

  describe 'automatic event sorter' do
    describe 'declaration' do
      let(:passive_agent_class) {
        Class.new(Agent) do
          include SortableEvents

          cannot_create_events!
        end
      }

      let(:active_agent_class) {
        Class.new(Agent) do
          include SortableEvents
        end
      }

      describe 'can_order_created_events!' do
        it 'should refuse to work if called from an Agent that cannot create events' 


        it 'should work if called from an Agent that can create events' 

      end

      describe 'can_order_created_events?' do
        it 'should return false unless an Agent declares can_order_created_events!' 


        it 'should return true if an Agent declares can_order_created_events!' 

      end
    end

    describe 'behavior' do
      class Agents::EventOrderableAgent < Agent
        include SortableEvents

        default_schedule 'never'

        can_order_created_events!

        attr_accessor :payloads_to_emit

        def self.valid_type?(name)
          true
        end

        def check
          payloads_to_emit.each do |payload|
            create_event payload: payload
          end
        end

        def receive(events)
          events.each do |event|
            payloads_to_emit.each do |payload|
              create_event payload: payload.merge('title' => payload['title'] + event.payload['title_suffix'])
            end
          end
        end
      end

      let :new_agent do
        options = {}
        options['events_order'] = @events_order
        Agents::EventOrderableAgent.new(name: 'test', options: options) { |agent|
          agent.user = users(:bob)
          agent.payloads_to_emit = payloads
        }
      end

      let(:payloads) {
        [
          { 'title' => 'TitleA', 'score' => 4,  'updated_on' => '7 Jul 2015' },
          { 'title' => 'TitleB', 'score' => 2,  'updated_on' => '25 Jun 2014' },
          { 'title' => 'TitleD', 'score' => 10, 'updated_on' => '10 Jan 2015' },
          { 'title' => 'TitleC', 'score' => 10, 'updated_on' => '9 Feb 2015' },
        ]
      }

      it 'should keep the order of created events unless events_order is specified' 


      it 'should sort events created in check() in the order specified in events_order' 


      it 'should sort events created in receive() in the order specified in events_order' 


      describe 'with the include_sort_info option enabled' do
        let :new_agent do
          agent = super()
          agent.options['include_sort_info'] = true
          agent
        end

        it 'should add sort_info to events created in check() when events_order is not specified' 


        it 'should add sort_info to events created in check() when events_order is specified' 


        it 'should add sort_info to events created in receive() when events_order is specified' 

      end
    end
  end
end

