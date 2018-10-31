# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Componentize do
  context 'when included in a class' do
    class self::ComponentHost
      include Componentize
    end

    class self::Component1
      include RSpec::ExampleGroups::Componentize::WhenIncludedInAClass::ComponentHost::Component
    end

    it 'has a list of components' 


    it 'has a module base' 


    it 'can have components associated' 


    it 'is only included once' 


    it 'eager loads all components in a directory' 


    it 'eager loads all components in a directory path' 

  end

  context 'when there are multiple hosts' do
    class self::ComponentHost1
      include Componentize
    end

    class self::ComponentHost2
      include Componentize
    end

    class self::Component2
      include RSpec::ExampleGroups::Componentize::WhenThereAreMultipleHosts::
        ComponentHost2::Component
    end

    it 'has a unique set of components per host' 

  end
end

