require 'spec_helper'

RSpec.describe Hashie::Extensions::Mash::KeepOriginalKeys do
  let(:keeping_mash) do
    Class.new(Hashie::Mash) do
      include Hashie::Extensions::Mash::KeepOriginalKeys
    end
  end

  it 'keeps the keys in the resulting hash identical to the original' 


  it 'indifferently responds to keys' 


  it 'responds to all method accessors like a Mash' 


  it 'keeps the keys that are directly passed without converting them' 

end

