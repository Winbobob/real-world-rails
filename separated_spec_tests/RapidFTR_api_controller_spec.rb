require 'spec_helper'

class TestController < Api::ApiController
  def index
    render :json => 'blah'
  end

  def forbidden
    authorize! :index, NilClass
  end
end

describe TestController, :type => :controller do
  before :each do
    Rails.application.routes.draw do
      # add the route that you need in order to test
      get '/' => 'test#index'
      get '/forbidden' => 'test#forbidden'
    end
  end

  after :each do
    # be sure to reload routes after the tests run, otherwise all your
    # other controller specs will fail
    Rails.application.reload_routes!
  end

  it 'should return 422 for malformed json' 


  it 'should throw HTTP 401 when session is expired' 


  it 'should throw HTTP 403 when not authorized' 


  it 'should throw HTTP 403 when device is blacklisted' 


  it 'should override session expiry timeout from configuration' 


  it 'should extend session lifetime' 

end

