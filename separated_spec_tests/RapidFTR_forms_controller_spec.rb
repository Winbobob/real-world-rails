require 'spec_helper'

describe FormsController, :type => :controller do
  before :each do
    reset_couchdb!
  end

  describe '.index' do
    it 'should assign all Forms for use in the view' 

  end

  describe '.bulk_update' do
    it 'should use the StandardFormsService to persist data' 

  end
end

