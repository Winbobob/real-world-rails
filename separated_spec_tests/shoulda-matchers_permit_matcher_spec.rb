require 'unit_spec_helper'

describe Shoulda::Matchers::ActionController::PermitMatcher, type: :controller do
  shared_examples 'basic tests' do
    it 'accepts a subset of the permitted attributes' 


    it 'accepts all of the permitted attributes' 


    it 'rejects attributes that have not been permitted' 


    it 'rejects when #permit has not been called' 


    it 'tracks multiple calls to #permit for different subparameters' 

  end

  it 'requires an action' 


  it 'requires a verb for a non-restful action' 


  context 'when operating on the entire params hash' do
    include_context 'basic tests' do
      def permit_with_conditional_slice_of_params(permit, options = {})
        permit
      end

      def params_with_conditional_require(params, *filters)
        params
      end
    end
  end

  context 'when operating on a slice of the params hash' do
    include_context 'basic tests' do
      def permit_with_conditional_slice_of_params(
        permit,
        all_params: [:user],
        selected_param: :user
      )
        params = all_params.reduce({}) do |hash, param|
          hash.merge(param => { any: 'value' })
        end

        permit.add_params(params).on(selected_param)
      end

      def params_with_conditional_require(params, *filters)
        if filters.none?
          filters = [:user]
        end

        params.require(*filters)
      end
    end

    it 'rejects if asserting that parameters were not permitted, but on the wrong slice' 


    it 'tracks multiple calls to #permit for the same subparameter' 

  end

  it 'can be used more than once in the same test' 


  it 'allows extra parameters to be provided if the route requires them' 


  it 'works with #update specifically' 


  it 'works when multiple ActionController::Parameters were instantiated' 


  describe '#matches?' do
    it 'does not raise an error when #fetch was used instead of #require (issue #495)' 


    context 'stubbing params on the controller' do
      it 'still allows the original params hash to be modified and accessed prior to the call to #require' 


      it 'still allows #require to return a slice of the params' 


      it 'does not permanently stub the params hash' 


      it 'prevents permanently stubbing params on error' 

    end
  end

  describe '#description' do
    it 'returns the correct string' 


    context 'when a verb is specified' do
      it 'returns the correct string' 

    end
  end

  describe 'positive failure message' do
    context 'when no parameters were permitted' do
      it 'returns the correct message' 

    end

    context 'when some, but not all, parameters were permitted' do
      it 'returns the correct message, including missing attributes' 

    end

    context 'qualified with #on' do
      context 'when the subparameter was never required' do
        it 'returns the correct message' 

      end

      context 'when the subparameter was required' do
        context 'but no parameters were permitted' do
          it 'returns the correct message' 

        end

        context 'but some, but not all, parameters were permitted' do
          it 'returns the correct message' 

        end
      end
    end
  end

  describe 'negative failure message' do
    it 'returns the correct message' 


    context 'qualified with #on' do
      it 'returns the correct message' 

    end
  end

  describe '#for' do
    context 'when given :create' do
      it 'POSTs to the controller' 

    end

    context 'when given :update' do
      if rails_gte_4_1?
        it 'PATCHes to the controller' 

      else
        it 'PUTs to the controller' 

      end
    end

    context 'when given a custom action and verb' do
      it 'calls the action with the verb' 

    end
  end

  let(:simulated_error_class) do
    Class.new(StandardError)
  end

  def define_controller_with_strong_parameters(options = {}, &action_body)
    model_name = options.fetch(:model_name, 'User')
    controller_name = options.fetch(:controller_name, 'UsersController')
    collection_name = controller_name.
      to_s.sub(/Controller$/, '').underscore.
      to_sym
    action_name = options.fetch(:action, :some_action)
    routes = options.fetch(:routes, -> { resources collection_name })

    define_model(model_name)

    controller_class = define_controller(controller_name) do
      define_method action_name do
        if action_body
          if action_body.arity == 0
            instance_eval(&action_body)
          else
            action_body.call(self)
          end
        end

        head :ok
      end
    end

    setup_rails_controller_test(controller_class)

    define_routes(&routes)

    controller_class
  end

  def define_controller_raising_exception
    _simulated_error_class = simulated_error_class

    controller_class = define_controller('Examples') do
      define_method :create do
        raise _simulated_error_class
      end
    end

    setup_rails_controller_test(controller_class)

    define_routes do
      get 'examples', to: 'examples#create'
    end

    controller_class
  end

  def build_context
    double('context', post: nil, put: nil, patch: nil, delete: nil)
  end

  def expect_to_have_made_controller_request(context:, verb:, action:, params:)
    if action_pack_gte_5?
      expect(context).to have_received(verb).with(action, params: params)
    else
      expect(context).to have_received(verb).with(action, params)
    end
  end
end

