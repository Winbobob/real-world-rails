module RSpec
  module Mocks
    RSpec.describe 'MockExpectationError' do

      class Foo
        def self.foo
          bar
        rescue StandardError
        end
      end

      it 'is not caught by StandardError rescue blocks' 

    end
  end
end

