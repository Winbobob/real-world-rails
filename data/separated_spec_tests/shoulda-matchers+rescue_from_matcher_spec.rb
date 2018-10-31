require 'unit_spec_helper'

describe Shoulda::Matchers::ActionController::RescueFromMatcher, type: :controller do
  context 'a controller that rescues from RuntimeError' do
    it 'asserts controller is setup with rescue_from' 


    context 'with a handler method' do
      it 'asserts rescue_from can find the handler when it is public' 


      it 'asserts rescue_from can find the handler when it is protected' 


      it 'asserts rescue_from can find the handler when it is private' 


      it 'asserts rescue_from was not set up with incorrect handler method' 


      it 'asserts the controller responds to the handler method' 

    end

    context 'without a handler method' do
      it 'the handler method is not included in the description' 

    end
  end

  context 'a controller that does not rescue from RuntimeError' do
    it 'asserts controller is not setup with rescue_from' 

  end

  def check_rescue_with_method_for(controller)
    expect(controller).to rescue_from(RuntimeError).with(:error_method)
  end

  def controller_with_rescue_from
    define_controller 'RescueRuntimeError' do
      rescue_from(RuntimeError) {}
    end
  end

  def controller_with_rescue_from_and_invalid_method
    define_controller 'RescueRuntimeErrorWithMethod' do
      rescue_from RuntimeError, with: :error_method
    end
  end

  def controller_with_rescue_from_and_method(access = :public)
    controller = controller_with_rescue_from_and_invalid_method
    class << controller
      def error_method
        true
      end
    end

    case access
    when :protected
      class << controller
        protected :error_method
      end
    when :private
      class << controller
        private :error_method
      end
    end

    controller
  end
end

