require 'rails_helper'

describe EventBus do

  let(:subject) { EventBus }
  let(:my_proc) { Proc.new { self.inspect } }
  let(:my_param_proc) { Proc.new { |param| param.is_a? my_param } }
  let(:my_param) { Object }

  before { @listeners = subject.class_variable_get(:@@listeners); subject.clear }
  after { subject.class_variable_set(:@@listeners, @listeners) }

  describe 'listen' do
    it 'activates a listener with an event name' 


    it 'activates a listener with params' 


    it 'does not activate events with a different event name' 


    it 'can accept multiple event names' 

  end

  describe 'deafen' do
    it 'silences listeners with an event name' 


    it 'does not silence other events' 


    it 'can accept multiple event names' 

  end

  describe 'clear' do
    it 'empties the listeners' 

  end
end

