require 'spec_helper'

RSpec.describe 'Retries Exhausted block' do
  class FooClass < TestWorkerAlternative
    sidekiq_retries_exhausted do |msg, exception|
      bar('hello')
      foo(msg)
      baz(exception)
    end

    def self.bar(input)
    end

    def self.foo(msg)
    end

    def self.baz(exception)
    end
  end

  it 'executes whatever is within the block' 


  it 'passes message and exception to the block' 


  it 'sets a default value for the message and exception' 

end

