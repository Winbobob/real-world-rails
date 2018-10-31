# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DateTimeHelper do

  include DateTimeHelper

  describe '#simple_date' do

    it 'formats a date in html by default' 


    it 'formats a date in the specified format' 


    it 'raises an argument error if given an unrecognized format' 


  end

  describe '#simple_date_html' do

    it 'formats a date in a time tag' 


  end

  describe '#simple_date_text' do

    it 'should respect time zones' 


    it 'should handle Date objects' 


  end

  describe '#simple_time' do

    it 'returns 00:00:00 for a date' 


    it 'returns the time component of a datetime' 


    it 'returns the time component of a time' 


  end
end

