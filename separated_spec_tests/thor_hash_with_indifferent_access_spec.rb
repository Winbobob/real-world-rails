require "helper"
require "thor/core_ext/hash_with_indifferent_access"

describe Thor::CoreExt::HashWithIndifferentAccess do
  before do
    @hash = Thor::CoreExt::HashWithIndifferentAccess.new :foo => "bar", "baz" => "bee", :force => true
  end

  it "has values accessible by either strings or symbols" 


  it "supports fetch" 


  it "has key checkable by either strings or symbols" 


  it "handles magic boolean predicates" 


  it "handles magic comparisons" 


  it "maps methods to keys" 


  it "merges keys independent if they are symbols or strings" 


  it "creates a new hash by merging keys independent if they are symbols or strings" 


  it "converts to a traditional hash" 


  it "handles reverse_merge" 


  it "handles reverse_merge!" 

end

