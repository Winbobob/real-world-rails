require 'spec_helper'
require 'rainbow'

RSpec.describe 'Rainbow refinement' do
  before do
    require 'rainbow/refinement'
    
    class ScopeNotIncluded
      def self.red_hello
        'hello'.red
      end
    end

    class ScopeIncluded
      using Rainbow
      def self.red_hello
        'hello'.red
      end
    end
  end

  it 'is not active by default' 


  it 'is available when used' 


  it 'respects disabled state' 

end

