require 'spec_helper'

describe ReportsController, :type => :controller do
  before :each do
    fake_login_as [Permission::REPORTS[:view]]
  end

  it 'should fetch reports' 


  it 'should sort descending by date' 


  it 'should set default page parameters' 


  it 'should set page number from request' 


  it 'should download report file' 


  describe '#permissions' do
    before :each do
      fake_field_worker_login
    end

    it 'should not list reports' 


    it 'should not download report' 

  end
end

