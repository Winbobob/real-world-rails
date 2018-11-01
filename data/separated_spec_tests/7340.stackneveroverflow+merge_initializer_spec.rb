require 'spec_helper'

describe Hashie::Extensions::MergeInitializer do
  class MergeInitializerHash < Hash
    include Hashie::Extensions::MergeInitializer
  end

  subject { MergeInitializerHash }

  it 'initializes with no arguments' 


  it 'initializes with a hash' 


  it 'initializes with a hash and a default' 

end

