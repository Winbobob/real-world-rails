require File.dirname(__FILE__) + '/../../spec_helper'

describe Radiant::Admin::ReferencesController do
  routes { Radiant::Engine.routes }
  #dataset :users

  before :each do
    login_as :existing
  end

  it "should render the associated template on GET to show" 

end

