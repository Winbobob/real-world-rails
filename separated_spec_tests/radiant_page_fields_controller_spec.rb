require File.dirname(__FILE__) + '/../../spec_helper'

describe Radiant::Admin::PageFieldsController do
  routes { Radiant::Engine.routes }
  #dataset :users

  before do
    login_as :admin
  end

  it "should assign a PageField object" 


end

