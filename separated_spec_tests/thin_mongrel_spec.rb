require 'spec_helper'
require 'digest/sha1'

describe Request, 'legacy Mongrel tests' do
  it 'should raise error on large header names' 


  it 'should raise error on large mangled field values' 

  
  it 'should raise error on big fat ugly headers' 


  it 'should raise error on random garbage' 

  
  private
    def rand_data(min, max, readable=true)
      count = min + ((rand(max)+1) *10).to_i
      res = count.to_s + "/"

      if readable
        res << Digest::SHA1.hexdigest(rand(count * 100).to_s) * (count / 40)
      else
        res << Digest::SHA1.digest(rand(count * 100).to_s) * (count / 20)
      end

      return res
    end
end

