# encoding: utf-8

require 'spec_helper'

unless defined?(RUBY_ENGINE) && RUBY_ENGINE == 'jruby'
  describe 'String#ascii_only' do
    it 'returns same value for string with ASCII chars only' 


    it 'returns string without non-ASCII chars' 


    it 'returns string without non-ASCII chars and with ASCII chars' 


    it 'does not change the original string' 

  end

  describe 'String#ascii_only!' do
    it 'returns same value for string with ASCII chars only' 


    it 'returns string without non-ASCII chars' 


    it 'returns string without non-ASCII chars and with ASCII chars' 


    it 'changes the original string' 

  end
end

