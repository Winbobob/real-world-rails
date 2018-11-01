require 'spec_helper'
require 'support/model_builder'

describe ChildIdsController, :type => :controller do

  include ModelBuilder

  before do
    fake_login
  end

  describe 'routing' do
    it 'should have a route retrieving all child Id and Rev pairs' 

  end

  describe 'response' do
    let(:model_class) { 'Child' }

    it 'should return Id and Rev for each child record' 

  end
end

