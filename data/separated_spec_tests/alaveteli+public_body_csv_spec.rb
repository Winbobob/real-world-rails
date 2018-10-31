# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PublicBodyCSV do

  describe '.default_fields' do

    it 'has a default set of fields' 

  end

  describe '.default_headers' do

    it 'has a default set of headers' 

  end

  describe '#fields' do

    it 'has a default set of fields' 


    # DO NOT include request_email (we don't want to make it
    # easy to spam all authorities with requests)
    it 'does not include the request_email attribute' 


    it 'allows custom fields to be set on instantiation' 


  end

  describe '#headers' do

    it 'has a default set of headers' 


    it 'allows custom headers to be set on instantiation' 


  end

  describe '#rows' do

    it 'is empty on instantiation' 


  end

  describe '#<<' do

    it 'adds an elements attributes to the rows collection' 


  end

  describe '#generate' do

    it 'generates the csv' 


  end

end

