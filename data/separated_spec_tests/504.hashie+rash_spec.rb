require 'spec_helper'

describe Hashie::Rash do
  subject do
    Hashie::Rash.new(
      /hello/ => 'hello',
      /world/ => 'world',
      'other' => 'whee',
      true    => false,
      1       => 'awesome',
      1..1000 => 'rangey',
      /(bcd)/ => proc { |m| m[1] }
      # /.+/ => "EVERYTHING"
    )
  end

  it 'finds strings' 


  it 'finds regexps' 


  it 'finds other objects' 


  it 'finds numbers from ranges' 


  it 'finds floats from ranges' 


  it 'evaluates proc values' 


  it 'finds using the find method' 


  it 'raises in find unless a key matches' 


  it 'yields in find unless a key matches' 


  it 'gives a default value' 


  it 'responds to hash methods' 


  it 'does not lose keys' 

end

