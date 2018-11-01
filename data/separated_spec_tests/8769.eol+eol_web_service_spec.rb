require 'spec_helper'

describe EOLWebService do
  before(:all) do 
    @url = 'http://usr:pass@example.eol/some_path'
    @params = '?param1=1&param2=something&param3=1and2'
  end

  describe '#uri_remove_param' do
    it 'should return same url if there are no params given' 


    it 'should remove any parameter' 

    
    it 'should remove any parameter with escaped amps' 


    it 'should remove more than one parameter' 


    it 'should remove ? at the end of url if no params left' 

  end

  describe '#url_accepted?' do
    before(:all) do
      @old_skip_config_val = Rails.configuration.skip_url_validations
      Rails.configuration.skip_url_validations = false
    end

    after(:all) do
      Rails.configuration.skip_url_validations = @old_skip_config_val
    end

    it 'accepts good URLs' 


    it 'accepts https URLs' 


    it 'rejects bad URLs' 


    it 'accepts redirects' 

    
    it "should allow redirect URLs from 'doi.org'" 

  end

end

