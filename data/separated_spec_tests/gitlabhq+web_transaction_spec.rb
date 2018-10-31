require 'spec_helper'

describe Gitlab::Metrics::WebTransaction do
  let(:env) { {} }
  let(:transaction) { described_class.new(env) }

  describe '#duration' do
    it 'returns the duration of a transaction in seconds' 

  end

  describe '#allocated_memory' do
    it 'returns the allocated memory in bytes' 

  end

  describe '#run' do
    it 'yields the supplied block' 


    it 'stores the transaction in the current thread' 


    it 'removes the transaction from the current thread upon completion' 

  end

  describe '#add_metric' do
    it 'adds a metric to the transaction' 

  end

  describe '#method_call_for' do
    it 'returns a MethodCall' 

  end

  describe '#increment' do
    it 'increments a counter' 

  end

  describe '#set' do
    it 'sets a value' 

  end

  describe '#finish' do
    it 'tracks the transaction details and submits them to Sidekiq' 

  end

  describe '#track_self' do
    it 'adds a metric for the transaction itself' 

  end

  describe '#submit' do
    it 'submits the metrics to Sidekiq' 


    it 'adds the action as a tag for every metric' 


    it 'does not add an action tag for events' 

  end

  describe '#labels' do
    context 'when request goes to Grape endpoint' do
      before do
        route = double(:route, request_method: 'GET', path: '/:version/projects/:id/archive(.:format)')
        endpoint = double(:endpoint, route: route)

        env['api.endpoint'] = endpoint
      end
      it 'provides labels with the method and path of the route in the grape endpoint' 


      it 'does not provide labels if route infos are missing' 

    end

    context 'when request goes to ActionController' do
      let(:request) { double(:request, format: double(:format, ref: :html)) }

      before do
        klass = double(:klass, name: 'TestController')
        controller = double(:controller, class: klass, action_name: 'show', request: request)

        env['action_controller.instance'] = controller
      end

      it 'tags a transaction with the name and action of a controller' 


      context 'when the request content type is not :html' do
        let(:request) { double(:request, format: double(:format, ref: :json)) }

        it 'appends the mime type to the transaction action' 

      end

      context 'when the request content type is not' do
        let(:request) { double(:request, format: double(:format, ref: 'http://example.com')) }

        it 'does not append the MIME type to the transaction action' 

      end
    end

    it 'returns no labels when no route information is present in env' 

  end

  describe '#add_event' do
    it 'adds a metric' 


    it "does not prefix the metric's series name" 


    it 'tracks a counter for every event' 


    it 'tracks the event name' 


    it 'allows tracking of custom tags' 

  end
end

