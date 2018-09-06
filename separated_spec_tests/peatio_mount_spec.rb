require 'spec_helper'

module APIv2
  class Mount

    get "/null" do
      ''
    end

    get "/broken" do
      raise Error, code: 2014310, text: 'MtGox bankrupt'
    end

  end
end

describe APIv2::Mount do

  it "should use auth and attack middleware" 


  it "should allow 3rd party ajax call" 


  context "handle exception on request processing" do
    it "should render json error message" 

  end

  context "handle exception on request routing" do
    it "should render json error message" 

  end

end

