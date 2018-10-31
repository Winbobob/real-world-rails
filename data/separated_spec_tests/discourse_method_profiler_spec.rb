require 'rails_helper'
require_dependency 'method_profiler'

describe MethodProfiler do
  class Sneetch
    def beach
    end

    def recurse(count = 5)
      if count > 0
        recurse(count - 1)
      end
    end
  end

  it "can bypass recursion on demand" 


  it "can transfer data between threads" 

end

