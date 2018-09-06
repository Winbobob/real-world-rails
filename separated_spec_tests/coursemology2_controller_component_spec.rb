# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::ControllerComponentHost::Component do
  class self::DummyComponent
    include Course::ControllerComponentHost::Component

    def initialize(*)
    end
  end

  context 'when a class first includes the module' do
    subject { self.class::DummyComponent.new }
    it 'has an empty sidebar ' 


    it 'is enabled' 


    it 'has a generated key' 

  end
end

