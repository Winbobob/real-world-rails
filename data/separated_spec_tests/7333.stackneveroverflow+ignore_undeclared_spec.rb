require 'spec_helper'

describe Hashie::Extensions::IgnoreUndeclared do
  context 'included in Trash' do
    class ForgivingTrash < Hashie::Trash
      include Hashie::Extensions::IgnoreUndeclared
      property :city
      property :state, from: :provence
      property :str_state, from: 'str_provence'
    end

    subject { ForgivingTrash }

    it 'silently ignores undeclared properties on initialization' 


    it 'works with translated properties (with symbol keys)' 


    it 'works with translated properties (with string keys)' 


    it 'requires properties to be declared on assignment' 

  end

  context 'combined with DeepMerge' do
    class ForgivingTrashWithMerge < Hashie::Trash
      include Hashie::Extensions::DeepMerge
      include Hashie::Extensions::IgnoreUndeclared
      property :some_key
    end

    it 'deep merges' 

  end
end

