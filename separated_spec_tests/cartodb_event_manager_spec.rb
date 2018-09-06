require 'spec_helper'
require 'carto_gears_api/events/event_manager'
require 'carto_gears_api/events/base_event'

describe CartoGearsApi::Events::EventManager do
  class TestEvent < CartoGearsApi::Events::BaseEvent
  end

  class OtherEvent < CartoGearsApi::Events::BaseEvent
  end

  class NotAnEvent
  end

  let(:manager) { CartoGearsApi::Events::EventManager.send(:new) }

  describe '#subscribe' do
    it 'event type must be a subclass of BaseEvent' 


    it 'requires a block' 


    it 'subscribe with event and block' 

  end

  describe '#notify' do
    it 'triggers all subscribed events' 


    it 'should not trigger subscribers to other events' 


    it 'should not trigger unsubscribed handlers' 

  end
end

