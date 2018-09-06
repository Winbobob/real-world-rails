require 'spec_helper'

RSpec.describe 'String extensions' do
  [:gray, :red, :green, :yellow, :blue, :purple, :cyan, :white].each_with_index do |color, i|
    it "should have #{color} color" 


    it "should have #{color}ish color" 

  end

  it 'should have black and pale colors' 

end

