# encoding: utf-8
require 'spec_helper'

describe Slugifyer do
  describe 'book_slug' do
    it 'removes special characters and downcase' 


    it 'removes bikes and bicycles, because people just put them in everything' 


    it 'removes diacritics and bicycles, because people just put them in everything' 


    it 'changes + to plus for URL safety, and Trek uses + to differentiate' 

  end

  describe 'manufacturer' do
    it 'removes works rivendell' 

    it 'removes frameworks for legacy' 

    it 'removes bicycle company for Kona' 

    it 'does not remove WorkCycles' 

    it 'does not remove haibike' 

    it 'does not remove worksman' 

    it 'removes parens from EAI' 

  end
end

