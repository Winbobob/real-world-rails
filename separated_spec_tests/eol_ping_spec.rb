require File.dirname(__FILE__) + '/../../spec_helper'

describe 'API:ping' do
  before(:all) do
    truncate_all_tables
  end

  # pings are too frequent (we use them to check site health) and not worth logging
  it 'should NOT create API logs' 


  it 'should return XML' 


  it 'should return JSON' 


  it 'should return XML by default when no extension is provided' 

end

