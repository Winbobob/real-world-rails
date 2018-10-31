require 'spec_helper'
require 'digest/md5'

describe Filter do
  it 'should auto register available filters' 


  it 'should only register filters that actually exist' 


  it 'should return a list of registered filters when asked' 

end

describe FilterChain do
  before :each do
    Rails.cache.clear
    @filter_chain = FilterChain.new
  end

  it 'should combine inclusive only filters accurately' 


  it 'should combine exlusive only filters accurately' 


  it 'should combine inclusive and exclusive filters accurately' 


  it 'should handle filtering across different axes simultaneously' 


  it 'should default to all inclusive when empty' 


  it 'should cache the final result' 


  it 'should cache the intermediate results' 


  it 'should order cache keys consistently regardless of filter order' 


  it 'should recompute as needed when new filters are added' 


  it 'should define include and exclude methods for registered filters' 


end

