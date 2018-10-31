require 'spec_helper'
require 'custom_errors.rb'

describe CustomErrors, type: 'controller' do
  controller do
    include CustomErrors

    def raise_404
      raise ActiveRecord::RecordNotFound
    end

    def raise_500
      raise Exception
    end
  end

  before(:each) do
    Features.custom_errors.enabled = true
  end

  context '404 errors' do
    before(:each) do
      routes.draw { get 'raise_404' => 'anonymous#raise_404' }
    end

    it 'should catch 404 errors' 

  end

  context '500 errors' do
    before(:each) do
      routes.draw { get 'raise_500' => 'anonymous#raise_500' }
    end

    it 'should catch 500 errors' 


    it 'should be able to adjust log stack trace limit' 


    it 'should send an error notification to the admin' 

  end
end

