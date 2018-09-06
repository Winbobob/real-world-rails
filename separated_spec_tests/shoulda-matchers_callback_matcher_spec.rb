require 'unit_spec_helper'

describe Shoulda::Matchers::ActionController::CallbackMatcher, type: :controller do
  shared_examples 'CallbackMatcher' do |kind, callback_type|
    let(:kind) { kind }
    let(:callback_type) { callback_type }
    let(:method_name) { :authenticate_user! }
    let(:matcher) { described_class.new(method_name, kind, callback_type) }
    let(:controller) { define_controller('HookController').new }

    def match
      __send__("use_#{kind}_#{callback_type}", method_name)
    end

    it "matches when a #{kind} hook is in place" 


    it "does not match when a #{kind} hook is missing" 


    describe 'description' do
      it 'includes the filter kind and name' 

    end

    describe 'failure message' do
      it 'includes the filter kind and name that was expected' 

    end

    describe 'failure message when negated' do
      it 'includes the filter kind and name that was expected' 

    end

    private

    def add_callback(kind, callback_type, callback)
      controller.class.__send__("#{kind}_#{callback_type}", callback)
    end
  end

  if action_pack_lt_5?
    describe '#use_before_filter' do
      it_behaves_like 'CallbackMatcher', :before, :filter
    end

    describe '#use_after_filter' do
      it_behaves_like 'CallbackMatcher', :after, :filter
    end

    describe '#use_around_filter' do
      it_behaves_like 'CallbackMatcher', :around, :filter
    end
  end

  describe '#use_before_action' do
    it_behaves_like 'CallbackMatcher', :before, :action
  end

  describe '#use_after_action' do
    it_behaves_like 'CallbackMatcher', :after, :action
  end

  describe '#use_around_action' do
    it_behaves_like 'CallbackMatcher', :around, :action
  end
end

