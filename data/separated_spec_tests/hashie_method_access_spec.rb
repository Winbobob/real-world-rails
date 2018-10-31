require 'spec_helper'

describe Hashie::Extensions::MethodReader do
  class ReaderHash < Hash
    include Hashie::Extensions::MethodReader

    def initialize(hash = {})
      update(hash)
    end
  end

  subject { ReaderHash }

  it 'reads string keys from the method' 


  it 'reads symbol keys from the method' 


  it 'reads nil and false values out properly' 


  it 'raises a NoMethodError for undefined keys' 


  it 'returns false for undefined keys if key with question has been called ' 


  it 'returns true for defined keys if key with question has been called' 


  describe '#respond_to?' do
    it 'is true for string keys' 


    it 'is true for symbol keys' 


    it 'is false for non-keys' 

  end
end

describe Hashie::Extensions::MethodWriter do
  class WriterHash < Hash
    include Hashie::Extensions::MethodWriter
  end

  subject { WriterHash.new }

  it 'writes from a method call' 


  it 'converts the key using the #convert_key method' 


  it 'raises NoMethodError on non equals-ending methods' 


  it '#respond_to? correctly' 

end

describe Hashie::Extensions::MethodQuery do
  class QueryHash < Hash
    include Hashie::Extensions::MethodQuery

    def initialize(hash = {})
      update(hash)
    end
  end

  subject { QueryHash }

  it 'is true for non-nil string key values' 


  it 'is true for non-nil symbol key values' 


  it 'is false for false key values' 


  it 'is false for nil key values' 


  it 'raises a NoMethodError for non-set keys' 


  it '#respond_to? for existing string keys' 


  it '#respond_to? for existing symbol keys' 


  it 'does not #respond_to? for non-existent keys' 

end

describe Hashie::Extensions::MethodAccess do
  it 'includes all of the other method mixins' 

end

describe Hashie::Extensions::MethodOverridingWriter do
  class OverridingHash < Hash
    include Hashie::Extensions::MethodOverridingWriter
  end

  subject { OverridingHash.new }

  it 'writes from a method call' 


  it 'convertes the key using the #convert_key method' 


  it 'raises NoMethodError on non equals-ending methods' 


  it '#respond_to_missing? correctly' 


  context 'when writing a Hash method' do
    before { subject.zip = 'a-dee-doo-dah' }

    it 'overrides the original method' 


    it 'aliases the method with two leading underscores' 


    it 'does not re-alias when overriding an already overridden method' 

  end
end

describe Hashie::Extensions::MethodAccessWithOverride do
  it 'includes all of the other method mixins' 

end

