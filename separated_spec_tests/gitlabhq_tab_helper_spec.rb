require 'spec_helper'

describe TabHelper do
  include ApplicationHelper

  describe 'nav_link' do
    before do
      allow(controller).to receive(:controller_name).and_return('foo')
      allow(self).to receive(:action_name).and_return('foo')
    end

    it "captures block output" 


    it "performs checks on the current controller" 


    it "performs checks on the current action" 


    it "performs checks on both controller and action when both are present" 


    it "accepts a path shorthand" 


    it "passes extra html options to the list element" 

  end
end

