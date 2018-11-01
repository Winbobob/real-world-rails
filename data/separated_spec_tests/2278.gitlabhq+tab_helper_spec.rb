require 'spec_helper'

describe TabHelper do
  include ApplicationHelper

  describe 'nav_link' do
    before do
      allow(controller).to receive(:controller_name).and_return('foo')
      allow(self).to receive(:action_name).and_return('foo')
    end

    context 'with the content of the li' do
      it "captures block output" 

    end

    context 'with controller param' do
      it "performs checks on the current controller" 


      context 'with action param' do
        it "performs checks on both controller and action when both are present" 

      end

      context 'with namespace in path notation' do
        before do
          allow(controller).to receive(:controller_path).and_return('bar/foo')
        end

        it 'performs checks on both controller and namespace' 


        context 'with action param' do
          it "performs checks on both namespace, controller and action when they are all present" 

        end
      end
    end

    context 'with action param' do
      it "performs checks on the current action" 

    end

    context 'with path param' do
      it "accepts a path shorthand" 


      context 'with namespace' do
        before do
          allow(controller).to receive(:controller_path).and_return('bar/foo')
        end

        it 'accepts a path shorthand with namespace' 

      end
    end

    it "passes extra html options to the list element" 

  end
end

