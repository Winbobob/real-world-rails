require 'unit_spec_helper'

describe 'Shoulda::Matchers::Routing::RouteMatcher', type: :routing do
  shared_examples_for 'core tests' do
    context 'when the given method, path, controller, and action match an existing route' do
      it 'accepts' 


      context 'and the expected controller is specified as a symbol' do
        it 'accepts' 

      end

      context 'and the expected action is specified as a symbol' do
        it 'accepts' 

      end
    end

    context 'when the given method, path, controller, and action do not match an existing route' do
      it 'rejects' 

    end

    context 'when the given path, controller, and action match an existing route but the method does not' do
      it 'rejects' 

    end

    context 'when the given method, controller, and action match an existing route but the path does not' do
      it 'rejects' 

    end

    context 'when the given method and path match an existing route but the controller does not' do
      it 'rejects' 

    end

    context 'when the given method, path, and controller match an existing route but the action does not' do
      it 'rejects' 

    end

    context 'when the actual route has a param' do
      context 'and the expected params include that param' do
        it 'accepts' 


        context 'but its value was not specified as a string' do
          it 'accepts, treating it as a string' 

        end
      end

      context 'and the expected params do not match the actual params' do
        it 'rejects' 

      end
    end

    context 'when the actual route has a default param whose value is a symbol' do
      context 'and the expected params include a value for it' do
        context 'as a symbol' do
          it 'accepts' 

        end

        context 'as a string' do
          it 'accepts' 

        end
      end
    end

    context 'when the existing route has a glob segment' do
      context 'and a param is given which represents the segment' do
        it 'accepts' 

      end

      context 'and no param is given which represents the segment' do
        it 'rejects' 

      end
    end

    context 'when a port is specified' do
      context 'when the route is constrained to the same port' do
        it 'accepts' 

      end

      context 'when the route is not constrained to the same port' do
        it 'rejects' 

      end
    end
  end

  context 'given a controller and action specified as individual options' do
    include_examples 'core tests' do
      def build_route_matcher(method:, path:, port: nil, **params)
        super(method: method, path: path, port: port).to(params)
      end
    end
  end

  context 'given a controller and action joined together in a string' do
    include_examples 'core tests' do
      def build_route_matcher(method:, path:, controller:, action:, port: nil, **rest)
        super(method: method, path: path, port: port).
          to("#{controller}##{action}", **rest)
      end
    end
  end

  def define_controller_and_routes(method:, path:, controller:, action:, **params)
    define_controller(controller.camelize)

    define_routes do
      send(method, path, controller: controller, action: action, **params)
    end
  end

  def build_route_matcher(method:, path:, port:, **)
    route(method, path, port: port)
  end

  let(:port_constraint_class) do
    Class.new do
      def initialize(port)
        @port = port
      end

      def matches?(request)
        request.port == port
      end

      private

      attr_reader :port
    end
  end
end

