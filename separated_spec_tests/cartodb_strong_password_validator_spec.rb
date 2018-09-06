# encoding: utf-8

require 'spec_helper_min'

module Carto
  describe 'StrongPasswordValidator' do
    PASSWORD = '2{Patrañas}'.freeze

    it 'should be invalid when password too short' 


    it 'should be invalid when password too long' 


    it 'should be invalid when password does not have enough letters' 


    it 'should be invalid when password does not have enough numbers or symbols' 


    it 'should be valid when password has enough numbers but not enough symbols' 


    it 'should be valid when password has enough symbols but not enough numbers' 


    it 'should invalidate a nil password' 


    it 'should invalidate an empty password' 


    it 'should return an error array' 


    it 'should validate a good password' 

  end
end

