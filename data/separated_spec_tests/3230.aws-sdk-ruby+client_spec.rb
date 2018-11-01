require_relative 'spec_helper'

module Aws
  module AutoScaling
    describe Client do

      describe '#wait_until' do
        describe ':group_in_service' do

          # This waiter was failing due to an incorrect inflection
          # of the JMESPath argument path. The `InService` literal
          # string was being snake_cased to `in_service`
          it 'correct matches an in-service group' 


        end
      end
    end
  end
end

