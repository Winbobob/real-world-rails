require 'spec_helper'

RSpec.describe Mongoid::Matchers::HaveIndexFor do
  subject do
    Class.new do
      include Mongoid::Document

      field :fizz, as: :buzz, type: String

      index(foo: 1)
      index({ bar: 1 }, unique: true, background: true, drop_dups: true)
      index(foo: 1, bar: -1)
      index('baz._id' => 1)
      index(buzz: 1)
    end
  end

  it 'detects an index for singular field key' 


  it 'detects an index for multipple fields key' 


  it 'detects an index with options' 


  it 'detects an index with only part of options' 


  it 'detects an index for string key' 


  it 'detect an index for aliased fields' 

end

